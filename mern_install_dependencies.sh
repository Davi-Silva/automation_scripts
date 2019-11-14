#!/bin/bash
parent_path=$( cd "$(dirname "${BASH_SOURCE[0]}")" ; pwd -P )
cd "$parent_path"
cd ..
mkdir course
cd course
code .
yarn init -y
yarn add -D concurrently
yarn add -D eslint
echo "Adding development scripts..."
awk 'NR>1&&/dependencies/{print "\t\"scripts\": {\n\t\t\"server\": \"cd backend && yarn run dev\",\n\t\t\"client\": \"cd frontend && yarn run start\",\n\t\t\"dev\": \"concurrently \\\"yarn run server\\\" \\\"yarn run client\\\"\"\n\t},"}1' package.json >> package.json
for i in 1 2 3 4 5 6 7 8 9 10
do
  sed -i "1d" package.json
done
echo "Cloning Repositories..."
git clone "https://github.com/Davi-Silva/cryptic-activist-backend.git"
git clone "https://github.com/Davi-Silva/cryptic-activist-frontend.git"
mv course-backend backend
mv course-frontend frontend
echo "Installing BACKEND ROOT eslint..."
yarn eslint --init
echo "Installing FRONTEND ROOT eslint..."
yarn eslint --init
echo "cd into backend folder..."
cd ../backend
yarn install
cd ../frontend
yarn install
cd ..
yarn install
yarn run dev
echo "Done."