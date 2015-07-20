#!/bin/sh

TRASH_BASE=~/.trash
TRASH_TAIL_1=`date +"%F"`
TRASH_TAIL_2=`date +"%T"`
TRASH_DIR=$TRASH_BASE/$TRASH_TAIL_1/$TRASH_TAIL_2

files=
for arg in $*
do
    if [ $arg != '-rf' ]; then
        files="$files $arg"
    fi
done

if [ ".$files" == "." ]; then
    echo "No such file or directory"
    exit 1
fi

mkdir -p $TRASH_DIR
mv -f $files $TRASH_DIR
