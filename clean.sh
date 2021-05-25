#!/bin/bash
gracefulExit() {
    exit 0
}

clean() {
    rm -rf ans.txt answer.txt ans answer question-answer.txt question-answer
    clear
}

trap "gracefulExit" INT TERM QUIT PWR

if [[ -e ans.txt ]] || [[ -e answer ]] || [[ -e ans ]] || [[ -e answer.txt ]]; then
    clean
    gracefulExit
fi
