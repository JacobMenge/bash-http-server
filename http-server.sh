#!/bin/bash

PORT=8080
DIR=/var/www/html

# server header sent to clients
HEADER="HTTP/1.1 200 OK\nContent-Type: text/html\n\n"

# function that handles client requests
function handle_request {

  # read the first line of the request (e.g. "get /index.html http/1.1")
  read request
  
  # extract the path from the request (e.g. "/index.html")
  path=$(echo $request | cut -d" " -f2)
  
  # if the path is empty, use "/index.html" as the default
  if [ -z "$path" ]; then
    path="/index.html"
  fi
  # concatenate the output directory with the path
  file="$DIR$path"
  # check if the file exists and is readable
  if [ -f "$file" ] && [ -r "$file" ]; then
    # send the contents of the file to the client
    echo -e "$HEADER$(cat $file)"
  else
    # send an error message to the client
    echo -e "HTTP/1.1 404 Not Found\nContent-Type: text/plain\n\n404 Not Found"
  fi
}

# start the server and wait for incoming requests
echo "server is running on port $PORT"
while true; do
  # accept an incoming connection
  client=$(nc -l -p $PORT)
  # handle the client request
  handle_request <<< "$client"
  # close the connection to the client
  sleep 1
  echo -e "HTTP/1.1 200 OK\nContent-Type: text/html\nConnection: close\n\n"
done
