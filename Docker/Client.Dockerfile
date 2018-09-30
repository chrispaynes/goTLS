FROM golang:1.11.0

ARG PKG

ENV PKG "$PKG"

ENV GOBIN /go/bin

COPY . /go/src/github.com/chrispaynes/goTLS/pkg

WORKDIR /go/src/github.com/chrispaynes/goTLS/pkg/$PKG

RUN go get && go get github.com/pilu/fresh

ENTRYPOINT [ "fresh" ]
