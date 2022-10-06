#!/bin/sh

INPUT=$1

BASE_NAME=$( basename "$INPUT" )
FILENAME=${BASE_NAME%.*}
EXT=${BASE_NAME##*.}


BLOCK_WIDTH=145
BLOCK_HEIGHT=145


X=32
BASE_Y=1124
Y=$BASE_Y
ROWS=5
COLUMNS=7
I=0

for (( xi=1; xi<=$COLUMNS; xi++ ))
do
    for (( yi=1; yi<=$ROWS; yi++ ))
    do
        OUTPUT_FILE_NAME=$( printf '%s_%03d.%s' "$FILENAME" "$I" "$EXT" )
        convert "$INPUT" -crop "$BLOCK_WIDTH"x"$BLOCK_HEIGHT"+"$X"+"$Y" +repage "$OUTPUT_FILE_NAME"
        Y=$( expr $Y + $BLOCK_HEIGHT )
        I=$( expr $I + 1 )
    done
    X=$( expr $X + $BLOCK_WIDTH )
    Y=$BASE_Y
done
