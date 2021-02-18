# @version 1.0.0
# Build an Go application with an small image built

FROM golang:1.14-alpine as builder

WORKDIR /go/src/app

COPY . .

RUN go build hello.go

FROM scratch

COPY --from=builder /go/src/app/hello .

CMD ["./hello"]