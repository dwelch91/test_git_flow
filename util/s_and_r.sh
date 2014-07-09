#!/bin/bash
#set -x

SEARCHDIR=$1
SEARCH=$2
REPLACE=$3

find $SEARCHDIR -type f -print0 | while read -d $'\0' file; do
echo "Processing $file"
ex $file << EOF
1,\$s/$SEARCH/$REPLACE/g
w
q
EOF
done

