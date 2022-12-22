#!/bin/bash

filename="$1"
echo "Reading urls from $filename"


while read -r line; do
    echo "Starting $line download"
    wget --no-check-certificate "$line"
    echo "Completed $line download"
    archive=$(basename "$line")
    echo "Unzipping $archive"
    unzip "$archive"
    echo "Finished unzipping $archive"
done < "$filename"