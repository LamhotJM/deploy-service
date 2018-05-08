#!bin/bash
case "$1" in
  start)
    ps axf | grep splitter | grep -v grep | awk '{print "kill -9 " $1}' | sh;
    dep ensure;
    make build;
    exec ./splitter &
    ;;
  run-all)
   kill $(lsof -t -i:6643)
   kill $(lsof -t -i:6622)
   kill $(lsof -t -i:6619)
   kill $(lsof -t -i:8089)
   cd splitter
   exec ./splitter &
   cd ..
   cd aleppo
   exec ./aleppo &
   cd ..
   cd chronos
   exec deploy/_output/api/bin/api &
    ;;
   install_go)
   echo bukalapak| sudo apt-get update
   echo bukalapak| sudo apt-get -y upgrade
   echo bukalapak| sudo curl -O sudo curl -O https://storage.googleapis.com/golang/go1.9.1.linux-amd64.tar.gz
   echo bukalapak| sudo tar -xvf go1.9.1.linux-amd64.tar.gz
   echo bukalapak| sudo mv go /usr/local
   export GOROOT=/usr/local/go
   export GOPATH=$HOME/work
   export PATH=$GOPATH/bin:$GOROOT/bin:$PATH
   echo bukalapak| source ~/.bashrc
    ;;
  stop)
    kill $(lsof -t -i:6643)
    ;;
  *)
    echo $"Usage: $0 {start|stop}"
    exit 1
esac
exit 0
