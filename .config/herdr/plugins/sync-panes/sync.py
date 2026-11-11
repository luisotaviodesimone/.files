"""tmux-like synchronize-panes for herdr.

herdr has no hook into keys typed in a pane, so "on" opens a small popup:
every key typed while it is open is sent to all panes of the current tab.
The popup receives the prefix too, so prefix+y (exit) is handled here.
"""
import codecs
import json
import os
import queue
import subprocess
import sys
import termios
import threading
import tty

HERDR = os.environ.get("HERDR_BIN_PATH", "herdr")
PREFIX = "\n"  # ctrl+j, keys.prefix in config.toml
OFF_KEY = "y"


def herdr(*args):
    out = subprocess.run([HERDR, *args], capture_output=True, text=True, check=True).stdout
    return json.loads(out)["result"] if out.strip().startswith("{") else None


def panes():
    return herdr("pane", "list")["panes"]


def on():
    tab = os.environ.get("HERDR_TAB_ID")
    if not tab:
        pane = os.environ.get("HERDR_PANE_ID") or json.loads(os.environ["HERDR_PLUGIN_CONTEXT_JSON"])["focused_pane_id"]
        tab = next(p["tab_id"] for p in panes() if p["pane_id"] == pane)
    herdr("plugin", "pane", "open", "--plugin", os.environ["HERDR_PLUGIN_ID"],
          "--entrypoint", "broadcast", "--env", f"SYNC_TAB_ID={tab}")


def sender(pane_id, q):
    # one thread per target keeps each pane's input in order without blocking typing
    while (text := q.get()) is not None:
        subprocess.run([HERDR, "pane", "send-text", pane_id, text], capture_output=True)


def split_off(text, pending):
    """Strip the prefix chord from typed text. Returns (text_to_send, pending_prefix, stop)."""
    out = []
    for ch in text:
        if pending:
            pending = False
            if ch == OFF_KEY:
                return "".join(out), False, True
            out.append(PREFIX if ch == PREFIX else ch)  # prefix twice = literal prefix, like herdr
        elif ch == PREFIX:
            pending = True
        else:
            out.append(ch)
    return "".join(out), pending, False


def broadcast():
    tab = os.environ["SYNC_TAB_ID"]
    # shortcut: targets are fixed when sync starts; panes split afterwards need prefix+y then prefix+Y
    targets = [p["pane_id"] for p in panes() if p["tab_id"] == tab]
    queues, threads = [], []
    for pane_id in targets:
        q = queue.Queue()
        threads.append(threading.Thread(target=sender, args=(pane_id, q)))
        threads[-1].start()
        queues.append(q)

    sys.stdout.write(f"\033[1;30;43m SYNC \033[0m {len(targets)} panes · prefix+y sai")
    sys.stdout.flush()
    decoder = codecs.getincrementaldecoder("utf-8")(errors="ignore")
    pending = stop = False
    old = termios.tcgetattr(0)
    tty.setraw(0)
    try:
        while not stop and (chunk := os.read(0, 4096)):
            text = decoder.decode(chunk).replace("\0", "")  # argv can't carry NUL
            text, pending, stop = split_off(text, pending)
            for q in queues if text else ():
                q.put(text)
    finally:
        termios.tcsetattr(0, termios.TCSADRAIN, old)
        for q in queues:
            q.put(None)  # flush what was typed before prefix+y, then stop
        for t in threads:
            t.join()


if __name__ == "__main__":
    if sys.argv[1] == "test":
        assert split_off("ab", False) == ("ab", False, False)
        assert split_off("a\ny", False) == ("a", False, True)
        assert split_off("\n\nx", False) == ("\nx", False, False)
        assert split_off("y", True) == ("", False, True)
        assert split_off("a\n", False) == ("a", True, False)
        print("ok")
    else:
        {"on": on, "broadcast": broadcast}[sys.argv[1]]()
