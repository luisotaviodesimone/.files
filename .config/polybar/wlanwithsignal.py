from subprocess import run
from sys import argv

if len(argv) != 2:
    raise Exception("Expected argument: interface name")

ifc = argv[1]
wifi_output1 = run(["iwconfig", ifc], capture_output=True).stdout.decode("utf-8")
wifi_output2 = run(["ip", "-4", "a", "show", ifc], capture_output=True).stdout.decode(
    "utf-8"
)
ethernet_output = ""
if wifi_output1 and wifi_output2:
    lines1 = wifi_output1.splitlines()
    lines2 = wifi_output2.splitlines()

    name = lines1[0].split(":")[-1].replace('"', "").strip()
    if len(name) > 10:
        name = name[:7] + "..."
    dbm = round(float(lines1[5].split("=")[-1].split(" ")[0]))
    state = lines2[0].split()[8].strip()

    dbm_status = ""
    ethernet_status = "%{F#ff0000}󰈂"
    color_reset = "%{F-}"

    if dbm >= -50:
        dbm_status = "%{F#a6e3a1}󰤨"
    elif -60 <= dbm < -50:
        dbm_status = "%{F#f9e2af}󰤥"
    elif -70 <= dbm < -60:
        dbm_status = "%{F#ff5733}󰤢"
    else:
        dbm_status = "%{F#ff0000}󰤟"

    for interface in ["eth0", "enp2s0"]:
        ethernet_output = run(
            ["ip", "-4", "a", "show", interface], capture_output=True
        ).stdout.decode("utf-8")
        if ethernet_output:
            ethernet_lines = ethernet_output.splitlines()
            ethernet_state = lines2[0].split()[8].strip()
            match ethernet_state:
                case "UP":
                    ethernet_color = "%{F#a6e3a1}"
                    ethernet_status = f"{ethernet_color}󰈁"
                    break

    match state:
        case "UP":
            logo = dbm_status + "%{F-}"
            print(f"{ethernet_status} {logo} {color_reset} {name}")
        case _:
            logo = "%{F#707880}󰤮"
            print(f"{ethernet_status} {logo} {ifc} {state}")
