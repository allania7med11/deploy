SCRIPT_DIR="$(dirname "${BASH_SOURCE[0]}")"
$SCRIPT_DIR/git/setup.sh
$SCRIPT_DIR/ngnix/setup.sh
$SCRIPT_DIR/docker/setup.sh
$SCRIPT_DIR/db/setup.sh