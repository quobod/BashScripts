#!/usr/bin/bash

# Prevents errors in a pipeline from being masked
set -o pipefail
# All variables must be previously defined
# set -u
# Halt the script immediately at ecountered error
set -e
# Print executed commands
# set -x

declare -ri GEXIT=0
declare -ri GERR=121
declare -r NAME="lab"
declare -r DESC="This program does absolutely nothing yet."

gracefulExit() {
    exit "$GEXIT"
}

synopsis() {
    printf "\n\t\t%s\n%s\n\t%s\n\t%s\n\n" \
        "$(color -x 208 "${NAME^^}")" \
        "$(color -x 222 "Synopsis")" \
        "$(color -x 153 "${0} <h?>")" \
        "$(color -x 153 "${0} <cl>")"
}

help() {
    printf "\n\t\t%s\n\n" "$(color -x 208 "${NAME^^}")"
    printf "%s\n" "$(color -w "$DESC")"
    printf "\n%s\n\n\t%s\n\t%s\n\t%s\n\t%s\n\n" \
        "$(color -x 222 "Example Usage:")" \
        "$(color -x 153 "${0} <?>\tPrints this message")" \
        "$(color -x 153 "${0} <h>\tPrints the help message")" \
        "$(color -x 153 "${0} <c>\tDoes nothing at all")" \
        "$(color -x 153 "${0} <l>\tDoes nothing at all")"
}

trap "gracefulExit" INT TERM QUIT PWR

while getopts ':?hlc' OPTION; do
    case "$OPTION" in
    c)
        printf "Arguments Count: %i" "$#"
        printf "\n%s\n" "$(color -w "${1} switch passed")"
        gracefulExit
        ;;

    \
        \
        h)
        help
        gracefulExit
        ;;

    \?)
        synopsis
        gracefulExit
        ;;

    l)
        printf "Arguments Count: %i" "$#"
        printf "\n%s\n" "$(color -w "${1} switch passed")"
        gracefulExit
        ;;

    esac

done

shift "$(("$OPTIND" - 1))"
