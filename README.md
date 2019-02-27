# Docker Kerio-Connect
![Docker Pulls](https://img.shields.io/docker/pulls/starcraft66/kerio-connect.svg)
![Docker Stars](https://img.shields.io/docker/stars/starcraft66/kerio-connect.svg)
![Docker Layers](https://images.microbadger.com/badges/image/starcraft66/kerio-connect.svg)
![Docker Version](https://images.microbadger.com/badges/version/starcraft66/kerio-connect.svg)
![Docker Automated build](https://img.shields.io/docker/automated/starcraft66/kerio-connect.svg)
![Docker Build Status](https://img.shields.io/docker/build/starcraft66/kerio-connect.svg)

Kerio Connect is a fully featured enterprise-class email solution.
More details at http://www.kerio.com/products/kerio-connect/server.

## Instructions

Pull the latest docker image:

```bash
docker pull starcraft66/kerio-connect:latest
```

Or build it yourself:

```bash
git clone https://github.com/starcraft66/docker-kerio-connect.git
cd docker-kerio-connect
docker build -t starcraft66/kerio-connect .
```

### Run Kerio Connect

```bash
docker run --name="kerio" \
-p 4040:4040 \
-p 22:22 -p 25:25 -p 465:465 -p 587:587 -p 110:110 -p 995:995 \
-p 143:143 -p 993:993 -p 119:119 -p 563:563 -p 389:389 -p 636:636 \
-p 80:80 -p 443:443 -p 5222:5222 -p 5223:5223 \
-v /path/to/mailfolder:/opt/kerio/mailserver starcraft66/kerio-connect 
```

### Configure Kerio

https://\<ip of host\>:4040
