#!/bin/bash
# Authors: Jonathan Funk
# Utility for cleaning up ephemeral dev databases on PR closes
#
# Requires: yq
# Script flags & error handling
#
set -e # failfast
trap 'echo "Error occurred at line $LINENO while executing function $FUNCNAME"' ERR
#
# Imports
#
# shellcheck source=.github/scripts/utils.sh
source .github/scripts/utils.sh
#

# location of PR values file
if [ -z "$VALUES_FILE" ]; then
    PR_VALUES_FILEPATH="charts/services/crunchy/values-dev.yaml"
fi
if [ ! -f "$ID_PATH" ]; then
    ID_PATH=".global.devCleanupID"
fi
if [ ! -f "$DB_PREFIX" ]; then
    DB_PREFIX="app"
fi

set_id() {
    new_id="${1}"
    echo_work "Setting new cleanup ID to '$new_id'"
    yq eval "$ID_PATH = \"$new_id\"" -i "$PR_VALUES_FILEPATH"
    echo_completed "New cleanup ID set to '$new_id'"
}

unset_id() {
    echo_work "Unsetting cleanup ID"
    yq eval "$ID_PATH = ~" -i "$PR_VALUES_FILEPATH"
    echo_completed "Cleanup ID unset"
}

main() {
    case "$1" in
        setid|s)
            set_id "${@:2}"
            ;;
        unsetid|u)
            unset_id
            ;;
    esac
}
main "$@"