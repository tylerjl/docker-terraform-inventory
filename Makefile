app = terraform-inventory
rev = $(shell git rev-parse --short HEAD)
app-rev = $(shell git -C $(app) rev-parse --short HEAD)

.PHONY: image
image:
	docker build -t $(app):$(rev)-$(app-rev) .

.PHONY: tag
tag:
	docker tag $(app):$(rev)-$(app-rev) $(USER)/$(app):$(rev)-$(app-rev)

.PHONY: push
push: tag
	docker push $(USER)/$(app)
