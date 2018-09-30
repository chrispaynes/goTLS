FROM golang:1.11.0

ARG PKG

ENV PKG "$PKG"

WORKDIR /go/src/$PKG

ENV GOBIN /go/bin

COPY ./cert/server.crt ./server.crt
COPY ./cert/server.key ./server.key

COPY ./pkg/$PKG .

RUN go get \
    && go get github.com/pilu/fresh

ENTRYPOINT [ "fresh" ]
