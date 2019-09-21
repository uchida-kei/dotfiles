#!/bin/bash

SCRIPT_DIR=$(cd $(dirname $0) && pwd)

for f in $SCRIPT_DIR/.??*
do
	[[ "$f" == "$SCRIPT_DIR/.git" ]] && continue
	[[ "$f" == "$SCRIPT_DIR/.gitignore" ]] && continue
	[[ "$f" == "$SCRIPT_DIR/.DS_Store" ]] && continue

	ln -sf $f ~/
	
	echo "Deploy $f complete"
	
done
