$start_dev.sh
#!/bin/sh
cd /home/leanon/Documents/Dev/Davi
mkdir course
cd course
code .
yarn init -y
yarn add concurrently
awk 'NR>1&&/dependencies/{print "\t\"scripts\": {\n\t\t\"server\": \"cd backend && yarn run dev\",\n\t\t\"client\": \"cd frontend && yarn run start\",\n\t\t\"dev\": \"concurrently \\\"yarn run server\\\" \\\"yarn run client\\\"\"\n\t},"}1' package.json >> package.json
for i in 1 2 3 4 5 6 7 8 9
do
  sed -i "1d" package.json
done
echo "Cloning Repositories..."
git clone "https://github.com/Davi-Silva/course-backend.git"
git clone "https://github.com/Davi-Silva/course-frontend.git"
mv course-backend backend
mv course-frontend frontend
cd backend
yarn install
cd ..
cd frontend
yarn install
cd ..
yarn install
yarn run dev
echo Done.