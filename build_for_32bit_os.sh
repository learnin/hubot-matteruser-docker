#!/bin/bash

docker image build -t hubotmatteruserdocker_hubot \
  --build-arg http_proxy=$http_proxy \
  --build-arg https_proxy=$https_proxy \
  --build-arg HUBOT_NAME=mmbot \
  --build-arg HUBOT_OWNER=none \
  --build-arg HUBOT_DESCRIPTION="Hubot with matteruser adapter" \
  .
