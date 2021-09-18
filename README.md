# Puppeteer docker image for Raspberry Pi 4

[![Build Status](https://drone.slr.ovh/api/badges/sylvainleroux/rpi-node-puppeteer/status.svg)](https://drone.slr.ovh/sylvainleroux/rpi-node-puppeteer)

- Based on Ubuntu 21.04 LTS
- Contains
  - Node 14.17.6
  - Puppeteer 10.2.0
  - Chromimum 85.0.4183.83-0ubuntu2
- Tested envirnments
  - linux amd64
  - linux arm64

## Build image

```
docker build -t sylvainleroux/rpi-node-puppeteer .
```

Or for a multi-arch build

```
docker buildx build --platform linux/amd64,linux/arm64,linux/arm/v7 -t sylvainleroux/rpi-node-puppeteer:latest --push .
```

## Run

```

docker run -i --init --rm --cap-add=SYS_ADMIN --name test registry.slr.ovh/rpi-node-puppeteer  node -e "`cat test_script.js`"
```
