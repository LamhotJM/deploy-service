#!bin/bash
case "$1" in
  start)
    ps axf | grep $service | grep -v grep | awk '{print "kill -9 " $1}' | sh;
    dep ensure;
    make build;
    exec ./$service &
    ;;
  stop)
    kill $(lsof -t -i:6643)
    ;;
  *)
    echo $"Usage: $0 {start|stop}"
    exit 1
esac
exit 0
