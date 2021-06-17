FROM golang:rc-alpine

COPY ./backend /tmp
COPY ./frontend /tmp

RUN mkdir /JDC /JDC/public /tmp/JDC \
    && cd /tmp/backend \
    && go build -o /JDC/JDC -pkgdir /tmp/JDC \
    && mv /tmp/frontend/* /JDC/public \
    && rm -rf /tmp/JDC /tmp/backend /tmp/frontend \
    && chmod +x /JDC/JDC

WORKDIR /JDC

ENTRYPOINT ./JDC