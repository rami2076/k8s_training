# About

Sample用のDockerImageを作成するためのディレクトリ

1. 以下を実行してテンプレートを作成
1. Dockerfileを編集してバージョンを変更

```bash
# Create project directory.
mkdir fluentd_sample
cd fluentd_sample

# Download default fluent_filter.conf and entrypoint.sh. This file will be copied to the new image.
# VERSION is v1.7 like fluentd version and OS is alpine or debian.
# Full example is https://raw.githubusercontent.com/fluent/fluentd-docker-image/master/v1.10/debian/fluent.conf
VERSION=v1.18
OS=alpine
curl -v https://raw.githubusercontent.com/fluent/fluentd-docker-image/master/"${VERSION}"/"${OS}"/fluent.conf > fluent.conf
curl -v https://raw.githubusercontent.com/fluent/fluentd-docker-image/master/"${VERSION}"/"${OS}"/entrypoint.sh > entrypoint.sh
chmod +x entrypoint.sh

# Create plugins directory. plugins scripts put here will be copied to the new image.
mkdir plugins

curl -v https://raw.githubusercontent.com/fluent/fluentd-docker-image/master/Dockerfile.sample > Dockerfile
```

# docker image push

```bash
cd ./fluentd_sample
docker build --tag fluentd-sample .
# confirm
docker images
# run
docker run -it --rm --name custom-docker-fluent-logger -v $(pwd)/log:/fluentd/log fluentd-sample:latest
docker inspect -f '{{.NetworkSettings.IPAddress}}' custom-docker-fluent-logger
docker run --log-driver=fluentd --log-opt tag="docker.{{.ID}}" --log-opt fluentd-address=FLUENTD.ADD.RE.SS:24224 python:alpine echo Hello
# and force flush buffered logs
docker kill -s USR1 custom-docker-fluent-logger

# login
docker login
# push image
export UNAME=sakusennx
docker tag fluentd-sample:latest ${UNAME}/fluentd-sample:latest
docker push ${UNAME}/fluentd-sample:latest
```

# REF

- https://github.com/fluent/fluentd-docker-image/blob/master/HOWTOBUILD.md
