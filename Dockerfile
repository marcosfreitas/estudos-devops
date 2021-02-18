# @version 1.0.0
# Build an Go application with an small image built

FROM golang:1.14-alpine

WORKDIR /go/src/app

COPY ./src .

#RUN apk add bash;
# go build hello.go; pwd; ls .

CMD ["go", "run", "hello.go"]