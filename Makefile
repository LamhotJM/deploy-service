all-dtb: build-all dtb
build-all:
	cd ../splitter;make dep;dep ensure;make build;./splitter &
dtb:
	docker-compose build splitter
	docker-compose up
clean:
	docker-compose down
delete-images:
	ps axf | grep splitter | grep -v grep | awk '{print "kill -9 " $1}'
