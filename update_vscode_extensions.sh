#!/bin/bash
echo "Updating VS Code extensions file..."
parent_path=$( cd "$(dirname "${BASH_SOURCE[0]}")" ; pwd -P )
cd "$parent_path"
echo $parent_path
code --list-extensions | xargs -L 1 echo code --install-extension > vscode_extensions.txt
git add .
git commit -m "VS Code extensions updated."
git push
echo "VS Code extensions file updated."
