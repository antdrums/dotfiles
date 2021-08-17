#!/bin/bash
FILENAME=$1
OUTPUT_DIR=$2
while read line; do
	if ! [ -d "$OUTPUT_DIR/$line" ]; then
		mkdir -p "$OUTPUT_DIR/$line"
	fi
	rsync -rv --ignore-existing "$line/" "$OUTPUT_DIR/$line/"
done < $FILENAME
