FROM fluent/fluentd:v1.18.0-1.3

USER root

RUN apk add --no-cache --update --virtual .build-deps \
        sudo build-base ruby-dev \
 # customize following instruction as you wish
 && sudo gem install fluent-plugin-elasticsearch \
 && sudo gem sources --clear-all \
 && apk del .build-deps \
 && rm -rf /home/fluent/.gem/ruby/2.5.0/cache/*.gem

COPY fluent_copy.conf /fluentd/etc/fluent.conf
COPY entrypoint.sh /bin/

USER fluent
