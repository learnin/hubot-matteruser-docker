FROM node:6.3

ARG HUBOT_NAME=mmbot
ARG HUBOT_OWNER=none
ARG HUBOT_DESCRIPTION="Hubot with matteruser adapter"

RUN npm -g config set proxy ${http_proxy} && npm -g config set https-proxy ${https_proxy}
RUN npm install -g yo generator-hubot

RUN useradd -s /bin/bash -m -d /home/hubot hubot

USER hubot

WORKDIR /home/hubot

RUN yo hubot --adapter matteruser --owner="${HUBOT_OWNER}" --name=${HUBOT_NAME} --description="${HUBOT_DESCRIPTION}" --defaults && \
  sed -i /heroku/d ./external-scripts.json && \
  sed -i /redis-brain/d ./external-scripts.json && \
  npm install hubot-scripts

ENV MATTERMOST_HOST=192.168.99.100 \
  MATTERMOST_GROUP=mmTeamName \
  MATTERMOST_USER=mmUser \
  MATTERMOST_PASSWORD=mmPassword \
  MATTERMOST_WSS_PORT=80 \
  MATTERMOST_TLS_VERIFY=false \
  HUBOT_JENKINS_URL=http://192.168.99.100:8080 \
  HUBOT_JENKINS_AUTH=admin:admin

ADD hubot-scripts.json /home/hubot/

CMD /home/hubot/bin/hubot -n ${HUBOT_NAME} -a matteruser
