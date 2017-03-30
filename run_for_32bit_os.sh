#!/bin/bash

# data volume
docker volume create --name hubotmatteruserdocker-data

# app
docker container run \
  -d \
  -e MATTERMOST_HOST=${MATTERMOST_HOST} \
  -e MATTERMOST_GROUP=${MATTERMOST_GROUP} \
  -e MATTERMOST_USER=${MATTERMOST_USER} \
  -e MATTERMOST_PASSWORD=${MATTERMOST_PASSWORD} \
  -e MATTERMOST_HTTP_PORT=${MATTERMOST_HTTP_PORT} \
  -e MATTERMOST_WSS_PORT=${MATTERMOST_WSS_PORT} \
  -e MATTERMOST_TLS_VERIFY=${MATTERMOST_TLS_VERIFY} \
  -e MATTERMOST_USE_TLS=${MATTERMOST_USE_TLS} \
  -e HUBOT_JENKINS_URL=${HUBOT_JENKINS_URL} \
  -e HUBOT_JENKINS_AUTH=${HUBOT_JENKINS_AUTH} \
  -e 'TZ=Asia/Tokyo' \
  --name hubotmatteruserdocker_app_1 \
  --restart unless-stopped \
  -v /etc/localtime:/etc/localtime:ro \
  -v hubotmatteruserdocker-data:/home/hubot \
  hubotmatteruserdocker_app
