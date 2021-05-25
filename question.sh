#!/bin/bash
DIALOG=${DIALOG=gdialog}

gracefulExit() {
    exit 0
}

usage() {
    printf "%s\t%s\n\n" "$(color -g "Usage:")" "$(color -w "${0} \"Quoted text\"")"
    gracefulExit
}

trap "gracefulExit" INT PWR QUIT TERM

if [[ $# -ne 1 ]]; then
    printf "%s\n" "$(color -r "Expecting one quoted argument")"
    usage
else
    $DIALOG --title "Question" --yesno "${1}" 58 81 --clear
    case $? in
    0) echo "yes" >ans.txt ;;

    1) echo "no" >ans.txt ;;
    esac
    gracefulExit
fi
