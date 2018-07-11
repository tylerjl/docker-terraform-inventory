FROM golang as build

WORKDIR /go/src/github.com/adammck/terraform-inventory
ADD terraform-inventory .

RUN go get ./...
RUN go build .

FROM alpine

MAINTAINER Tyler Langlois <ty@tjll.net>
WORKDIR /
COPY --from=build /go/src/github.com/adammck/terraform-inventory/terraform-inventory /terraform-inventory
ENTRYPOINT ["/terraform-inventory"]
