#!/bin/bash

# location of the HTTP server
SERVER_PATH=/path/to/server

# port number the server is running on
PORT=8080

# PID file of the server
PID_FILE=/var/run/http-server.pid

# start the server
start() {
  if [ -f $PID_FILE ]; then
    echo "HTTP server is already running"
  else
    cd $SERVER_PATH
    nohup ./http-server.sh > /dev/null 2>&1 &
    echo $! > $PID_FILE
    echo "HTTP server has been started"
  fi
}

# stop the server
stop() {
  if [ -f $PID_FILE ]; then
    kill $(cat $PID_FILE)
    rm $PID_FILE
    echo "HTTP server has been stopped"
  else
    echo "HTTP server is not running"
  fi
}

# get the status of the server
status() {
  if [ -f $PID_FILE ]; then
    echo "HTTP server is running (PID $(cat $PID_FILE))"
  else
    echo "HTTP server is stopped"
  fi
}

# execute the script
case "$1" in
  start)
    start
    ;;
  stop)
    stop
    ;;
  restart)
    stop
    start
    ;;
  status)
    status
    ;;
  *)
    echo "Usage: $0 {start|stop|restart|status}"
    exit 1
esac

exit 0
