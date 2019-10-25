#!/bin/bash
echo "Installing VS Code extensions..."
parent_path=$( cd "$(dirname "${BASH_SOURCE[0]}")" ; pwd -P )
cd "$parent_path"
chmod +x ./vscode_extensions.txt
./vscode_extensions.txt
echo "VS Code extensions is done installing."