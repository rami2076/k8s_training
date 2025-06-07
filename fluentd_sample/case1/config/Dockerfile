FROM fluent/fluentd:v1.15.3-1.0

USER root

RUN apk add --no-cache --update --virtual .build-deps \
        sudo build-base ruby-dev \
 # customize following instruction as you wish
 && sudo gem install fluent-plugin-elasticsearch \

COPY fluent.conf /fluentd/etc/
COPY entrypoint.sh /bin/

USER fluent