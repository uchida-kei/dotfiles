#!/bin/bash

for f in .??*
do
	[[ "$f" == ".git" ]] && continue
	[[ "$f" == ".gitignore" ]] && continue
	[[ "$f" == ".DS_Store" ]] && continue

	ln -sf ~/dotfiles/$f ~/
	
	echo "Deploy $f complete"
	
done
