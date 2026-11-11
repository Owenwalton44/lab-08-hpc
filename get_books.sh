#!/bin/bash
set -euo pipefail
BUCKET=$1
DIR=$2
mkdir -p $DIR

aws s3 cp s3://""$BUCKET"""" $DIR"" --recursive --exclude "*" --include "*.txt"

echo "File Path" >  book_list.txt
find "$DIR" -name "*.txt" -exec realpath {} + | sort >> book_list.txt

n=$(wc -l < book_list.txt)
n=$((n-1))
echo "Wrote $n book files to book_list.txt"

