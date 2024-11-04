#!/bin/bash

#https://stackoverflow.com/questions/407184/how-to-check-the-extension-of-a-filename-in-a-bash-script
#https://superuser.com/questions/747884/how-to-write-a-script-that-accepts-input-from-a-file-or-from-stdin

MODEL_FILE="$1"
INPUT="$2"

if [ ! $# ]; then
    echo "bash lanin.sh model_file input"
    exit 0
fi

if [ ! -e "$MODEL_FILE" ]; then
    echo "Modelo não encontrado"
    exit 0
else
    if [[ ! "$MODEL_FILE" == *.bin ]]; then
        echo "Modelo não compatível"
    fi
fi

if [ -f "$INPUT" ]; then
    MODO_STRING=0
else
    MODO_STRING=1
fi

lanin() {
    rm result.txt
    if [ "$3" = 0 ]; then
        tool/fasttext predict "$1" "$2" >result.txt
    else

        tool/fasttext predict "$1" - <<<"$2" >result.txt
    fi
    cat result.txt
}

lanin "$MODEL_FILE" "$INPUT" "$MODO_STRING"
