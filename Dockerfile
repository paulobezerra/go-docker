# syntax=docker/dockerfile:1

FROM golang:1.16-alpine AS builder

WORKDIR /app

COPY . ./

RUN go mod init bezerrapaulo/hello
RUN go build hello.go

FROM hello-world:latest
WORKDIR /app
COPY --from=builder /app .
CMD ["./hello"]