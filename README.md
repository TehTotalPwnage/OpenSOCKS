# OpenSOCKS

## What is OpenSOCKS?
OpenSOCKS is a Docker container setup meant to allow for connection to an OpenVPN server via individual applications.
By default, OpenVPN reroutes all client traffic through the VPN and updates the resolver settings for the entire system.
However, there are caveats to this approach, such as when trying to run server applications.
OpenSOCKS allows for applications to use a SOCKS5 server in order to pass requests of that application only to the VPN.

## Installation Instructions
There is no official build image for this Dockerfile on the Docker Hub. However, you can still build it yourself.

Before you build this image, make sure you have a working installation of Docker and a proper OpenVPN configuration setup:

- An OpenVPN config file with certificates, keys, and other files concatenated into one
- An askpass directive in the case that the key is password protected

Do the following to deploy this image:

1. Clone the repository: `git clone https://github.com/TehTotalPwnage/OpenSOCKS.git`
2. Build the image under some suitable tag: `docker build . -t=opensocks`
3. Place the OpenVPN configuration in a folder named openvpn (the folder is ignored by .gitignore, don't worry about any information being leaked).
4. Grant deploy.sh execute permissions if it doesn't already have it and run it to create the container: `chmod +x deploy.sh && ./deploy.sh`
5. Start the container: `docker start opensocks_dev`

To connect to the SOCKS5 server, simply point your proxy settings to `localhost:1080`.
