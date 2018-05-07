ps axf | grep splitter | grep -v grep | awk '{print "kill -9 " $1}' | sh;
git pull origin master;
dep ensure;
make build;
./splitter&
