app = terraform-inventory
rev = $(shell git -C $(app) rev-parse --short HEAD)

.PHONY: image
image:
	docker build -t terraform-inventory:$(rev) .
