# Docker Kerio-Connect
![Docker Pulls](https://img.shields.io/docker/pulls/starcraft66/kerio-connect.svg)
![Docker Stars](https://img.shields.io/docker/stars/starcraft66/kerio-connect.svg)
![Docker Layers](https://images.microbadger.com/badges/image/starcraft66/kerio-connect.svg)
![Docker Automated build](https://github.com/starcraft66/docker-kerio-connect/workflows/Master%20Branch%20Image/badge.svg)
![Docker Automated build](https://github.com/starcraft66/docker-kerio-connect/workflows/Tagged%20Images/badge.svg)

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
-p 25:25 -p 465:465 -p 587:587 -p 110:110 -p 995:995 \
-p 143:143 -p 993:993 -p 119:119 -p 563:563 -p 389:389 -p 636:636 \
-p 80:80 -p 443:443 -p 5222:5222 -p 5223:5223 \
-v /path/to/cluster.cfg:/opt/kerio/mailserver/cluster.cfg \
-v /path/to/users.cfg:/opt/kerio/mailserver/users.cfg \
-v /path/to/mailserver.cfg:/opt/kerio/mailserver/mailserver.cfg \
-v /path/to/stats.dat:/opt/kerio/mailserver/stats.dat \
-v /path/to/charts.dat:/opt/kerio/mailserver/charts.dat \
-v /path/to/license:/opt/kerio/mailserver/license \
-v /path/to/store:/opt/kerio/mailserver/store \
-v /path/to/sslcert:/opt/kerio/mailserver/sslcert \
starcraft66/kerio-connect 
```

### Configure Kerio

https://\<ip of host\>:4040
