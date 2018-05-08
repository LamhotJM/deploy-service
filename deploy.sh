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
   cd now-you-see-me
   exec deploy/_output/api/bin/api app/api/main.go; &
   cd ..
   cd chronos
   exec deploy/_output/api/bin/api &
    ;;
  stop)
    kill $(lsof -t -i:6643)
    ;;
  *)
    echo $"Usage: $0 {start|stop}"
    exit 1
esac
exit 0
