# @version 1.0.0
# Build an Go application with an small image built

FROM golang:1.20-alpine as builder

WORKDIR /go/src/app

COPY ./src .

RUN go mod init teste
RUN go build math.go && ls -la

FROM scratch as prod

COPY --from=builder /go/src/app .

CMD ["./math"]
