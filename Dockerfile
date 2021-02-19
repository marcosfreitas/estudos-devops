# @version 1.0.0
# Build an Go application with an small image built

FROM golang:1.14-alpine as builder

WORKDIR /go/src/app

COPY ./src .

RUN go build hello.go &&\
    ls -la

FROM scratch as prod

COPY --from=builder /go/src/app .

#RUN apk add bash;
# go build hello.go; pwd; ls .

CMD ["./hello"]
