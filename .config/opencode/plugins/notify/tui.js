// Equivalent of the Claude Code Stop/PermissionRequest hooks: toast when a root session
// finishes or needs input. Follows the V2 `setup(api)` shape used by ../herdr-tui-session.js.
import { spawn } from "node:child_process";
import { fileURLToPath } from "node:url";

const SCRIPT = fileURLToPath(new URL("./notify.sh", import.meta.url));

function toast(message) {
  try {
    spawn("bash", [SCRIPT, "opencode", message], { detached: true, stdio: "ignore" }).unref();
  } catch {}
}

function setup(api) {
  return api.data.listen(({ details: event }) => {
    const data = event?.data;
    if (data == null) return;
    const sessionID = event.type === "form.created" ? data.form?.sessionID : data.sessionID;
    // Skip subagent sessions: only the root session should interrupt the user.
    if (sessionID && api.data.session.get(sessionID)?.parentID) return;
    switch (event.type) {
      case "session.execution.succeeded":
        toast("Aguardando sua interação!");
        break;
      case "permission.asked":
        toast("Permissão necessária");
        break;
      case "form.created":
        toast("Pergunta para você");
        break;
    }
  });
}

export default { id: "notify.toast", setup };
