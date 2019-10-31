#!/bin/bash
parent_path=$( cd "$(dirname "${BASH_SOURCE[0]}")" ; pwd -P )
echo "Pulling changes from remote repositories..."
cd "$parent_path"
echo $parent_path
cd ../course/backend
git pull
cd ../frontend
git pull
echo "Done"