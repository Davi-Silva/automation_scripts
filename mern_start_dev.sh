#!/bin/bash
parent_path=$( cd "$(dirname "${BASH_SOURCE[0]}")" ; pwd -P )
cd "$parent_path"
cd ..
[[ -d course ]] || ./automation_scripts/mern_install_dependencies.sh
cd course
code .
yarn run dev