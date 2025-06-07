# Fluentdのビルドイメージの作成

Fluentdのconfigを含めた状態でイメージを作成する際のサンプル．

## 手順の参照先

公式がimageをカスタムする際の手順を用意してくれているのでその手順に従えばconfigを含めたイメージの作成が可能．

## なぜimageにconfigを含めるのか？

k8sのマニフェストファイル(development.yaml)
にコンテナを定義してコンテナのイメージを公式のイメージのまま使用して設定だけfluent.confを外部ファイルに置き参照する方法を発見することができなかったためです．

### 詳細

自分が調べた範囲でimageにconfigを書かずk8sのマニフェストファイルから参照する書き方は2種類ありました．

1. k8sのConfigMapに直接直書きする
1. k8sのConfigMapを別のファイルとして定義してそのファイルを参照する形式

どちらもConfigMapを使う方法でイメージだけで起動した時との差異の発生や管理コストの増幅が考えられるので今回は採用しませんでした．

# 具体的な方法

具体的には，公式のリポジトリに記載がありますが少し分かりにくいので自分のメモ書きを残します．

## REF

https://github.com/fluent/fluentd-docker-image/blob/master/HOWTOBUILD.md

## commands

以下はコマンドと日本語で解説を追加しています．

```bash
# Create project directory.
# 作業用のデイレク取りを作成する．
mkdir custom-fluentd
cd custom-fluentd

# Download default fluent.conf and entrypoint.sh. This file will be copied to the new image.
# VERSION is v1.7 like fluentd version and OS is alpine or debian.
# Full example is https://raw.githubusercontent.com/fluent/fluentd-docker-image/master/v1.10/debian/fluent.conf
# fluentdのバージョンとosを指定してデフォルトの設定ファイルをDLします．
# fluentdのバージョンはGithubのReleasesに記載されているバージョンとは異なります．
# バージョンがv1.18.0-1.2の場合は，v1.18というふうにメジャーバージョンとマイナーバージョンのみしているする形式
curl https://raw.githubusercontent.com/fluent/fluentd-docker-image/master/VERSION/OS/fluent.conf > fluent.conf

# 実行するShellScriptを取得し権限を変更する．
curl https://raw.githubusercontent.com/fluent/fluentd-docker-image/master/VERSION/OS/entrypoint.sh > entrypoint.sh
chmod +x entrypoint.sh

# ここはOptionalなコマンド．
# 実際は，Dockerfileを書き換えてプラグインをinstallした状態にしておくため不要．
# Create plugins directory. plugins scripts put here will be copied to the new image.
mkdir plugins

# 基礎となるDockerfile
# バージョンなどが設定されていないので手動で書き換える必要がある
# imageのバージョンは以下を参考にしてください
# https://hub.docker.com/r/fluent/fluentd/
curl https://raw.githubusercontent.com/fluent/fluentd-docker-image/master/Dockerfile.sample > Dockerfile
```

## 以下はbashで実行できる形式したものです．

```bash
# Create project directory.
mkdir custom-fluentd
cd custom-fluentd

# Download default fluent_filter.conf and entrypoint.sh. This file will be copied to the new image.
# VERSION is v1.7 like fluentd version and OS is alpine or debian.
# Full example is https://raw.githubusercontent.com/fluent/fluentd-docker-image/master/v1.10/debian/fluent.conf
VERSION=v1.18
OS=alpine
curl https://raw.githubusercontent.com/fluent/fluentd-docker-image/master/"${VERSION}"/"${OS}"/fluent_filter.conf > fluent_filter.conf
curl https://raw.githubusercontent.com/fluent/fluentd-docker-image/master/v1.18/alpine/fluent.conf > fluent_filter.conf

curl https://raw.githubusercontent.com/fluent/fluentd-docker-image/master/"${VERSION}"/"${OS}"/entrypoint.sh > entrypoint.sh
chmod +x entrypoint.sh

# Create plugins directory. plugins scripts put here will be copied to the new image.
mkdir plugins

curl https://raw.githubusercontent.com/fluent/fluentd-docker-image/master/Dockerfile.sample > Dockerfile
```

# 以下は実行するためのコードです．

```bash
docker build -t custom-fluentd:latest ./
docker run -it --rm --name custom-docker-fluent-logger -v $(pwd)/log:/fluentd/log custom-fluentd:latest
docker inspect -f '{{.NetworkSettings.IPAddress}}' custom-docker-fluent-logger
docker run --log-driver=fluentd --log-opt tag="docker.{{.ID}}" --log-opt fluentd-address=FLUENTD.ADD.RE.SS:24224 python:alpine echo Hello
# and force flush buffered logs
docker kill -s USR1 custom-docker-fluent-logger
```

# 以下は動作確認に使用するコードです．

```bash
docker run --log-driver=fluentd --log-opt tag="docker.{{.ID}}" --log-opt fluentd-address=172.17.0.2:24224 python:alpine echo Hello
kubectl exec -it fluentd-proxy-deployment-2qqv7 fluentd  -- /bin/bash
docker container ls
CONTAINER_ID={hoge}
docker exec -i -t ${CONTAINER_ID} /bin/bash
```
