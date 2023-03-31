<h1 align="center">
 🔥 Simple and Efficient HTTP Server in Bash 🔥
</h1>
<p align="center">
This script implements a simple HTTP server in Bash. The server uses `nc` (Netcat) as the network backend and can serve static HTML files to clients.
</p>
  </br>

## Functionality 🚀

The server binds to a specified port (default 8080) and waits for incoming connections. When a client sends a request, it is processed by the `handle_request` function. This function extracts the path from the request and checks if the requested file is present and readable in the specified directory (default `/var/www/html`). If the file is present, its contents are sent to the client, otherwise a 404 Not Found response is sent.

## Usage 💻

1. Make sure Netcat (`nc`) is installed on your system.
2. Clone this repository or download the `http-server.sh` file.
3. Run the file with `bash http-server.sh`.
4. Check if the server is reachable on the specified port (default 8080) by accessing `http://localhost:8080` in your browser.

## Testing the Server with cURL 🚀

To test if the HTTP server is functioning correctly, you can use curl, a command-line tool for transferring data using various protocols, including HTTP. Here's how you can use curl to test the server:

Open a terminal or command prompt window.
Run the following command, replacing <port> with the port number that the server is running on (default 8080):
``````
curl http://localhost:<port>
``````

This should return the contents of the default index file, if one exists, served by the HTTP server. You can also test accessing a specific file by appending its path to the URL, for example:
``````
curl http://localhost:<port>/example.html
``````
This should return the contents of the example.html file, if it exists and is served by the HTTP server. 

If the server is running and serving files correctly, you should receive a response similar to the following:
``````
HTTP/1.1 200 OK
Content-Type: text/html

<html>
<head>
  <title>Example Page</title>
</head>
<body>
  <h1>Hello, World!</h1>
</body>
</html>
``````
This response shows that the HTTP request was successful (HTTP status code 200 OK) and that the response is in HTML format. The contents of the file being served are displayed below the header.


## Configuration 🔧

You can change the port and the directory where the static HTML files are stored by editing the following variables at the beginning of the script:
``````
PORT=8080
DIR=/var/www/html
``````

## Notes 📝

This script is intended for demonstration and learning purposes and should not be used in a production environment! It lacks important securityfeatures and has not been optimized for high performance and scalability. Instead, use an established HTTP server like Apache or Nginx.
