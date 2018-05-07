#!bin/bash
ps axf | grep splitter | grep -v grep | awk '{print "kill -9 " $1}' | sh;
dep ensure;
make build;
./splitter & kill %1 -o;
sleep 3
