#!/bin/bash
parent_path=$( cd "$(dirname "${BASH_SOURCE[0]}")" ; pwd -P )
cd "$parent_path"
cd ..
git clone "https://github.com/Davi-Silva/cryptic-activist.git"
cd cryptic-activist
echo "Cloning Repositories..."
git clone "https://github.com/Davi-Silva/cryptic-activist-backend.git"
git clone "https://github.com/Davi-Silva/cryptic-activist-frontend.git"
mv cryptic-activist-backend backend
mv cryptic-activist-frontend frontend
cd backend
yarn install
cd ..
cd frontend
yarn install
cd ..
yarn install
yarn run dev
echo Done.