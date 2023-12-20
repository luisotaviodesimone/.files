export YELLOW='\033[1;33m'
export RED='\033[0;31m'
export RESET='\033[0;0m'
export GREEN='\033[0;32m'

function isCommandInstalled() {
    command -v "$1" >/dev/null 2>&1 || alias | grep -q "$1"
}
