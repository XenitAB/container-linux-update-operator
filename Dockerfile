FROM golang:1.13-alpine3.10 as builder

RUN apk add -U make git bash
WORKDIR /go/src/github.com/coreos/container-linux-update-operator
COPY . .

RUN ls -al

RUN make release-bin


FROM alpine:3.10

RUN apk add --no-cache ca-certificates
RUN adduser -S -D -H -h /app appuser

USER appuser
COPY --from=builder /go/src/github.com/coreos/container-linux-update-operator/bin /app/
WORKDIR /app

ENTRYPOINT ["./update-agent"]
