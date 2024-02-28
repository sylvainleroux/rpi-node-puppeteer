# Base Image for running Puppeteer on Raspberry Pi 4

[![Build Status](https://drone.slr.ovh/api/badges/sylvainleroux/rpi-node-puppeteer/status.svg)](https://drone.slr.ovh/sylvainleroux/rpi-node-puppeteer)

## Build image

```
docker build -t registry.slr.ovh/rpi-node-puppeteer .
```

## Test run

```
$ docker run --rm -v "$(pwd)"/package.json:/package.json:ro -v "$(pwd)"/index.js:/index.js:ro registry.slr.ovh/rpi-node-puppeteer sh -c "npm install --silent && npm test"
> rpi-node-puppeteer-docker@1.0.0 test
> node index.js

{
  "pageTitle": "Google",
  "nodeVersion": "v21.6.2",
  "puppeteerVersion": "22.3.0",
  "browserVersion": "Chrome/122.0.6261.57"
}
```