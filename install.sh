#!/bin/bash

SCRIPT_DIR=$(cd $(dirname $0) && pwd)
VSCODE_SETTING_DIR=~/Library/Application\ Support/Code/User


for f in $SCRIPT_DIR/.??*
do
	[[ "$f" == "$SCRIPT_DIR/.vscode" ]] && continue	
	[[ "$f" == "$SCRIPT_DIR/.git" ]] && continue
	[[ "$f" == "$SCRIPT_DIR/.gitignore" ]] && continue
	[[ "$f" == "$SCRIPT_DIR/.DS_Store" ]] && continue

	ln -sf $f ~/
	
	echo "Deploy $f complete"
	
done

rm "$VSCODE_SETTING_DIR/.vscode/settings.json"
ln -sf "$SCRIPT_DIR/.vscode/settings.json" "${VSCODE_SETTING_DIR}/settings.json"

rm "$VSCODE_SETTING_DIR/.vscode/keybindings.json"
ln -sf "$SCRIPT_DIR/.vscode/keybindings.json" "${VSCODE_SETTING_DIR}/keybindings.json"

# install extention
cat $SCRIPT_DIR/.vscode/extensions_list | while read line
do
 code --install-extension $line
done

code --list-extensions > $SCRIPT_DIR/.vscode/extensions_list

echo "Deploy vscode setting complete"
