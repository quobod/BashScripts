#!/bin/bash

clearVars() {
    unset TEMP W
}

gracefulExit() {
    clearVars
    exit 0
}

trap "gracefulExit" INT TERM PWR

if [[ $# -gt 0 ]]; then
    for W in "$@"; do
        TEMP+="${W} "
    done
    printf "\e[28;5;24m%s\e[m\n" "${TEMP^}"
    gracefulExit
fi
