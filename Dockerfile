FROM golang:rc-alpine

COPY ./JDC /tmp/source

RUN mkdir /JDC /JDC/public /tmp/JDC \
    && apk add --no-cache --virtual .build-deps gcc g++ upx \
    && cd /tmp/source/backend \
    && go build -o /JDC/JDC -pkgdir /tmp/JDC \
    && upx /JDC/JDC \
    && mv /tmp/source/frontend/* /JDC/public \
    && rm -rf /tmp/JDC /tmp/source \
    && apk del .build-deps \
    && chmod +x /JDC/JDC

WORKDIR /JDC

ENTRYPOINT ./JDC