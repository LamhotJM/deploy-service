SPLITTER_IMG = docker images | grep splitter | awk '{print $$3}'

all-dtb: build-all dtb
build-all:
	cd ../splitter; GOOS=linux GOARCH=amd64 CGO_ENABLED=0 go build
dtb:
	docker-compose build splitter
	docker-compose up
clean:
	docker-compose down
delete-images:
	docker rmi -f $$(${SPLITTER_IMG})
