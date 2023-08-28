FROM golang:latest AS golang

WORKDIR /go

COPY . .

RUN go build fullcycle.go

FROM scratch

WORKDIR /go

COPY --from=golang /go/fullcycle .

CMD ["./fullcycle"]