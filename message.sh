#!/usr/bin/bash
DIALOG=${DIALOG=zenity}
declare -r title="Attention"

gracefulExit() {
    exit 0
}

usage() {
    printf "%s\n" "$(color -w "Synopsis")"
    printf "\t%s\n\t%s\n\n" "$(color -o "${0} <QuotedText>")" "$(color -o "${0} <QuotedText> <QuotedTitleText>")"
}

trap "gracefulExit" INT PWR QUIT TERM

case $# in
1)
    $DIALOG --info \
        --title ${title^^} \
        --width 217 \
        --height 110 \
        --text "${1}" \
        --ellipsize \
        --icon-name=emblem-shared
    gracefulExit
    ;;

2)
    declare label=$2
    if [ -z "$label" ]; then
        label="Attention"
    fi

    $DIALOG --info \
        --title ${label^^} \
        --width 217 \
        --height 110 \
        --text "${1}" \
        --ellipsize \
        --icon-name=emblem-shared
    gracefulExit
    ;;

*)
    usage
    gracefulExit
    ;;
esac
