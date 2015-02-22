#!/usr/bin/env bash

# could also be "#!/bin/bash"
# above linux specific, change to mac by "which bash" and fix path.
# also "which find" and fix path below.

set -e

SM_DIR="/home/mich/src/move/sm"
LG_DIR="/home/mich/src/move/lg"

# below is how to include spaces in filenames loop.
SAVEIFS=$IFS
IFS=$(echo -en "\n\b")

echo -e "\n$(date)" >> ./errors.txt
echo -e "Current directory is $(pwd)" >> ./errors.txt
echo -e "Runnings as user $(whoami)\n" >> ./errors.txt


#for WK_DIR in {a..p} {r..z} ; do
#for WK_DIR in q ; do
for WK_DIR in a ; do
  #for FILE in "$(ls $SM_DIR/$WK_DIR)""$(find . -name $SM_DIR/$WK_DIR/*$FILE_TYPE)"; do

  for FILE in $SM_DIR/$WK_DIR/* 
  do
    LG_MOVED="${FILE%.*}_large.${FILE##*.}"

    if [ -a "$LG_MOVED" ]
    then
# comparison html quotes could be swapped. eg echo '\<img src="
        echo "$FILE <img src='$FILE'> <img src='$LG_FILE'> <br />" >> $SM_DIR/$WK_DIR.html
    else
       # Do Nothing
    fi

  done


done

# restore space to $IFS
IFS=$SAVEIFS

exit 0
