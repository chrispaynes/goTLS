FROM golang:1.11.0

ARG PKG

ENV PKG "$PKG"

WORKDIR /go/src/$PKG

ENV GOBIN /go/bin

COPY ./pkg/$PKG .

RUN go get \
    && go get github.com/pilu/fresh

ENTRYPOINT [ "fresh" ]
