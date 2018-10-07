FROM golang:1.11.0

ARG CMD

ENV CMD "$CMD"

WORKDIR /go/src/$CMD

ENV GOBIN /go/bin

COPY ./cert/server.crt ./server.crt
COPY ./cert/server.key ./server.key

COPY ./cmd/$CMD .

RUN go get \
    && go get github.com/pilu/fresh

ENTRYPOINT [ "fresh" ]
