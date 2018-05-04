all-dtb: build-all dtb
build-all:
	cd ../splitter
	GOOS=linux GOARCH=amd64 CGO_ENABLED=0 make dep;GOOS=linux GOARCH=amd64 CGO_ENABLED=0 dep ensure;GOOS=linux GOARCH=amd64 CGO_ENABLED=0 make build;./splitter&;sleep 2;
dtb:
	docker-compose build splitter
	docker-compose up
clean:
	docker-compose down
delete-images:
	ps axf | grep splitter | grep -v grep | awk '{print "kill -9 " $1}' | sh
