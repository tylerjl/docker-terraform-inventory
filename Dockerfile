FROM golang as build

WORKDIR /go/src/github.com/adammck/terraform-inventory
ADD terraform-inventory .

RUN go get ./...
RUN go build .

FROM golang

MAINTAINER Tyler Langlois <ty@tjll.net>

COPY --from=build /go/src/github.com/adammck/terraform-inventory/terraform-inventory /go/bin/terraform-inventory
ENTRYPOINT ["/go/bin/terraform-inventory"]
