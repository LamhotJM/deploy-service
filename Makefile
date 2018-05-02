SPLITTER_IMG = docker images | grep splitter | awk '{print $$3}'

build-all: build-splitter splitter
build-splitter:
	cd ../splitter; GOOS=linux GOARCH=amd64 CGO_ENABLED=0 go build
splitter:
	docker-compose build splitter
	docker-compose up
clean:
	docker-compose down
delete-images:
	docker rmi -f $$(${SPLITTER_IMG})
