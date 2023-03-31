<h1 align="center">
 🔥 Simple and Efficient HTTP Server in Bash 🔥
</h1>

<p align="center">
This script implements a simple HTTP server in Bash. The server uses `nc` (Netcat) as the network backend and can serve static HTML files to clients.
</p>
  
## Functionality 🚀

The server binds to a specified port (default 8080) and waits for incoming connections. When a client sends a request, it is processed by the `handle_request` function. This function extracts the path from the request and checks if the requested file is present and readable in the specified directory (default `/var/www/html`). If the file is present, its contents are sent to the client, otherwise a 404 Not Found response is sent.

## Usage 💻

1. Make sure Netcat (`nc`) is installed on your system.
2. Clone this repository or download the `http-server.sh` file.
3. Run the file with `bash http-server.sh`.
4. Check if the server is reachable on the specified port (default 8080) by accessing `http://localhost:8080` in your browser.

## Configuration 🔧

You can change the port and the directory where the static HTML files are stored by editing the following variables at the beginning of the script:

``````
PORT=8080
DIR=/var/www/html
``````

## Notes 📝

This script is intended for demonstration and learning purposes and should not be used in a production environment! It lacks important securityfeatures and has not been optimized for high performance and scalability. Instead, use an established HTTP server like Apache or Nginx.
