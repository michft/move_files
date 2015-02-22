#!/usr/bin/env bash

# could also be "#!/bin/bash"
# above linux specific, change to mac by "which bash" and fix path.
# also "which find" and fix path below.

set -e

SM_DIR="/home/mich/src/move/sm"
LG_DIR="/home/mich/src/move/lg"
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
    LG_FILE="$LG_DIR${FILE#$SM_DIR}"
#    echo $LG_FILE tst
    if [ -a "$LG_FILE" ]
    then 
      LG_MOVE="${FILE%.*}_large.${FILE##*.}"
#      echo " mv -i $LG_FILE $LG_MOVE" >> moves_to_make.txt
       mv -i "$LG_FILE" "$LG_MOVE"
    else
      echo "$LG_FILE not found" >> errors.txt
    fi
  done
  for FILE in $LG_DIR/$WK_DIR/*
  do
    echo "$FILE has no corresponding small file" >> errors.txt
  done
done

# restore $IFS
IFS=$SAVEIFS

exit 0
