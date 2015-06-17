SIZES=(32 64 128 256)

if [ "$#" -ne "1" ]; then
	printf "Usage: %s <filename>\n" "$0"
	exit 1
fi

FILEPATH=${1%/*}

if [ "$FILEPATH" == "$1" ]; then
	FILEPATH="."
fi

FILENAME=${1##*/}
EXT=${FILENAME##*.}

if [ "$FILENAME" == "$EXT" ]; then
	EXT="png"
fi

FILENAME=${FILENAME%".$EXT"}

for size in "${SIZES[@]}"; do
	echo "$FILEPATH/$FILENAME-$size.$EXT"
	convert "$1" -resize "${size}x${size}" "$FILEPATH/$FILENAME-$size.$EXT"
done
