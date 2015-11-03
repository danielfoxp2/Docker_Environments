FROM nodebox

RUN apk add --update git \
    && git clone https://github.com/mucsi96/nightwatch-cucumber.git \
    && cd nightwatch-cucumber \
    && npm install \
    && apk del git \
    && rm -rf /tmp/* /var/log/* /var/tmp/* /var/cache/apk/*

CMD sh

