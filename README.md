# hubot-matteruser-docker

## Getting started

### When using Docker Compose
```shell
export http_proxy=http://your_proxy_host:your_proxy_port/
export https_proxy=http://your_proxy_host:your_proxy_port/
export HTTP_PROXY=$http_proxy
export HTTPS_PROXY=$https_proxy
export no_proxy=`docker-machine ip default`
export NO_PROXY=$no_proxy

export MATTERMOST_HOST=Mattermost host # e.g. export MATTERMOST_HOST=192.168.99.100
export MATTERMOST_GROUP=Mattermost group # e.g. export MATTERMOST_GROUP=mmtest1
export MATTERMOST_USER=Mattermost bot user id # e.g. export MATTERMOST_USER=hubottest@example.jp
export MATTERMOST_PASSWORD=Mattermost bot user password # e.g. export MATTERMOST_PASSWORD=hubottest
export MATTERMOST_HTTP_PORT=Mattermost HTTP port # e.g. export MATTERMOST_HTTP_PORT=50002
export MATTERMOST_WSS_PORT=Mattermost WebSocket port # e.g. export MATTERMOST_WSS_PORT=50002
export MATTERMOST_TLS_VERIFY=true: verify TLS certs, false: not verify # e.g. export MATTERMOST_TLS_VERIFY=false
export MATTERMOST_USE_TLS=true: use https/wss to connect Mattermost, false: use http/ws # e.g. export MATTERMOST_USE_TLS=false
export HUBOT_JENKINS_URL=Jenkins URL # e.g. export HUBOT_JENKINS_URL=http://192.168.99.100:50001
export HUBOT_JENKINS_AUTH=jenkins_user_id:jenkins_user_password # e.g. export HUBOT_JENKINS_AUTH=admin:admin

docker-compose up -d
```
### When not using Docker Compose(e.g. Windows 32bit)
```shell
export http_proxy=http://your_proxy_host:your_proxy_port/
export https_proxy=http://your_proxy_host:your_proxy_port/
export HTTP_PROXY=$http_proxy
export HTTPS_PROXY=$https_proxy
export no_proxy=`docker-machine ip default`
export NO_PROXY=$no_proxy

docker-machine scp run_for_32bit_os.sh default:/tmp/hubot_run_for_32bit_os.sh
docker-machine ssh default
export MATTERMOST_HOST=Mattermost host # e.g. export MATTERMOST_HOST=192.168.99.100
export MATTERMOST_GROUP=Mattermost group # e.g. export MATTERMOST_GROUP=mmtest1
export MATTERMOST_USER=Mattermost bot user id # e.g. export MATTERMOST_USER=hubottest@example.jp
export MATTERMOST_PASSWORD=Mattermost bot user password # e.g. export MATTERMOST_PASSWORD=hubottest
export MATTERMOST_HTTP_PORT=Mattermost HTTP port # e.g. export MATTERMOST_HTTP_PORT=50002
export MATTERMOST_WSS_PORT=Mattermost WebSocket port # e.g. export MATTERMOST_WSS_PORT=50002
export MATTERMOST_TLS_VERIFY=true: verify TLS certs, false: not verify # e.g. export MATTERMOST_TLS_VERIFY=false
export MATTERMOST_USE_TLS=true: use https/wss to connect Mattermost, false: use http/ws # e.g. export MATTERMOST_USE_TLS=false
export HUBOT_JENKINS_URL=Jenkins URL # e.g. export HUBOT_JENKINS_URL=http://192.168.99.100:50001
export HUBOT_JENKINS_AUTH=jenkins_user_id:jenkins_user_password # e.g. export HUBOT_JENKINS_AUTH=admin:admin
sh /tmp/hubot_run_for_32bit_os.sh
rm -f /tmp/hubot_run_for_32bit_os.sh
```

# For developers

## How to build and run

### When using Docker Compose
```shell
export http_proxy=http://your_proxy_host:your_proxy_port/
export https_proxy=http://your_proxy_host:your_proxy_port/
export HTTP_PROXY=$http_proxy
export HTTPS_PROXY=$https_proxy
export no_proxy=`docker-machine ip default`
export NO_PROXY=$no_proxy

export MATTERMOST_HOST=Mattermost host # e.g. export MATTERMOST_HOST=192.168.99.100
export MATTERMOST_GROUP=Mattermost group # e.g. export MATTERMOST_GROUP=mmtest1
export MATTERMOST_USER=Mattermost bot user id # e.g. export MATTERMOST_USER=hubottest@example.jp
export MATTERMOST_PASSWORD=Mattermost bot user password # e.g. export MATTERMOST_PASSWORD=hubottest
export MATTERMOST_HTTP_PORT=Mattermost HTTP port # e.g. export MATTERMOST_HTTP_PORT=50002
export MATTERMOST_WSS_PORT=Mattermost WebSocket port # e.g. export MATTERMOST_WSS_PORT=50002
export MATTERMOST_TLS_VERIFY=true: verify TLS certs, false: not verify # e.g. export MATTERMOST_TLS_VERIFY=false
export MATTERMOST_USE_TLS=true: use https/wss to connect Mattermost, false: use http/ws # e.g. export MATTERMOST_USE_TLS=false
export HUBOT_JENKINS_URL=Jenkins URL # e.g. export HUBOT_JENKINS_URL=http://192.168.99.100:50001
export HUBOT_JENKINS_AUTH=jenkins_user_id:jenkins_user_password # e.g. export HUBOT_JENKINS_AUTH=admin:admin

docker-compose -f docker-compose-build.yml build
docker-compose -f docker-compose-build.yml up -d
```
### When not using Docker Compose(e.g. Windows 32bit)
```shell
export http_proxy=http://your_proxy_host:your_proxy_port/
export https_proxy=http://your_proxy_host:your_proxy_port/
export HTTP_PROXY=$http_proxy
export HTTPS_PROXY=$https_proxy
export no_proxy=`docker-machine ip default`
export NO_PROXY=$no_proxy

docker image build -t hubotmatteruserdocker_app \
  --build-arg http_proxy=$http_proxy \
  --build-arg https_proxy=$https_proxy \
  --build-arg HUBOT_NAME=mmbot \
  --build-arg HUBOT_OWNER=none \
  --build-arg HUBOT_DESCRIPTION="Hubot with matteruser adapter" \
  .

docker volume create --name hubotmatteruserdocker-data

docker-machine ssh default

export MATTERMOST_HOST=Mattermost host # e.g. export MATTERMOST_HOST=192.168.99.100
export MATTERMOST_GROUP=Mattermost group # e.g. export MATTERMOST_GROUP=mmtest1
export MATTERMOST_USER=Mattermost bot user id # e.g. export MATTERMOST_USER=hubottest@example.jp
export MATTERMOST_PASSWORD=Mattermost bot user password # e.g. export MATTERMOST_PASSWORD=hubottest
export MATTERMOST_HTTP_PORT=Mattermost HTTP port # e.g. export MATTERMOST_HTTP_PORT=50002
export MATTERMOST_WSS_PORT=Mattermost WebSocket port # e.g. export MATTERMOST_WSS_PORT=50002
export MATTERMOST_TLS_VERIFY=true: verify TLS certs, false: not verify # e.g. export MATTERMOST_TLS_VERIFY=false
export MATTERMOST_USE_TLS=true: use https/wss to connect Mattermost, false: use http/ws # e.g. export MATTERMOST_USE_TLS=false
export HUBOT_JENKINS_URL=Jenkins URL # e.g. export HUBOT_JENKINS_URL=http://192.168.99.100:50001
export HUBOT_JENKINS_AUTH=jenkins_user_id:jenkins_user_password # e.g. export HUBOT_JENKINS_AUTH=admin:admin

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
```
