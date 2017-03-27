#!/bin/bash

# data volume
docker volume create --name hubotmatteruserdocker-data

# master
docker container run \
  -d \
  -e MATTERMOST_HOST=192.168.99.100 \
  -e MATTERMOST_GROUP=mmtest1 \
  -e MATTERMOST_USER=hubottest@example.jp \
  -e MATTERMOST_PASSWORD=hubottest \
  -e MATTERMOST_WSS_PORT=80 \
  -e MATTERMOST_TLS_VERIFY=false \
  -e MATTERMOST_USE_TLS=false \
  -e HUBOT_JENKINS_URL=http://192.168.99.100:8080 \
  -e HUBOT_JENKINS_AUTH=admin:admin \
  -e 'TZ=Asia/Tokyo' \
  --name hubotmatteruserdocker_hubot_1 \
  --restart always \
  -v /etc/localtime:/etc/localtime:ro \
  -v hubotmatteruserdocker-data:/home/hubot \
  hubotmatteruserdocker_hubot
