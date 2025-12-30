docker kill node-server
docker rm node-server

docker build -t node-server .
docker run -d -p 3001:3001 --name node-server node-server
