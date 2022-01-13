# BUILDER
FROM golang:latest AS builder
WORKDIR /go/src/app
COPY . .

RUN go get -d -v ./...
RUN go build -o wcvs

# RUNNING
FROM debian:buster
RUN mkdir /app
COPY --from=builder /go/src/app/wcvs /wcvs
WORKDIR /app/
COPY wordlists/ wordlists/
CMD ["/wcvs"]