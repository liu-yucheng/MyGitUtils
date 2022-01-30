#! /bin/bash

# Copyright 2022 Yucheng Liu. GNU GPL3 license.
# GNU GPL3 license copy: https://www.gnu.org/licenses/gpl-3.0.txt

# Clear all custom main branch names
# Retain the default main branch name (main)

if [[ $# -ne 0 ]]; then
    echo "Usage: ${0##*/}"
    exit 1
fi

# main branch names location
main_names_loc="${0%/*}/main-names.txt"

main_names=()
main_names[0]="main"

printf "%s\n" "${main_names[@]}" > "${main_names_loc}"

(
    # Turn command tracing on
    set -o xtrace

    cat "${main_names_loc}"
    git branch
)
