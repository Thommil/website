#/bin/bash

docker stop website
docker rm website

cp /etc/letsencrypt/live/thommil.com/fullchain.pem ssl/server.crt
cp /etc/letsencrypt/live/thommil.com/privkey.pem ssl/server.key

docker build -t website:latest .
docker run --name website --hostname website --network web -p 80:80/tcp -p 443:443/tcp --restart unless-stopped -d website:latest
