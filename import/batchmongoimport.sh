#!/bin/bash
for f in $*
do
	mongoimport --db mormon-missionaries --collection missionaries --file $f
	echo "Imported: $f"
done