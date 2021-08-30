#!/bin/bash

TOTAL=$(brew list | wc -l)
UTILITIES=0
TO_JUMP=0

APP="background-music"

for each in $(brew list); do
    if [ $each != $APP ]; then
        ((UTILITIES++))
    else
        break
    fi
done

TO_JUMP=$(($TOTAL-$UTILITIES))

for each in $(brew list | tail -n $TO_JUMP); do
    # echo $each
    brew upgrade $each
done

echo "Everything is up to date!"