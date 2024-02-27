# Puppeteer docker image for Raspberry Pi 4

[![Build Status](https://drone.slr.ovh/api/badges/sylvainleroux/rpi-node-puppeteer/status.svg)](https://drone.slr.ovh/sylvainleroux/rpi-node-puppeteer)

## Build image

```
docker build -t registry.slr.ovh/rpi-node-puppeteer .
```

Or for a multi-arch build

```
// Create builder for multi-arch build (docker buildx ls to list existing)
docker buildx create --name mybuilder --bootstrap --use
docker buildx build --platform linux/amd64,linux/arm64,linux/arm/v7 -t registry.slr.ovh/rpi-node-puppeteer:latest --push .
```

## Run

```
docker run registry.slr.ovh/rpi-node-puppeteer node -e "`cat test_script.js`"
{
  "pageTitle": "Google",
  "nodeVersion": "v21.6.2",
  "puppeteerVersion": "22.3.0",
  "browserVersion": "Chrome/122.0.6261.57"
}
```
