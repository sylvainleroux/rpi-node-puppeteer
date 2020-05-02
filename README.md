# Puppeteer docker image for Raspberry Pi 4

- Based on Ubuntu Bionic 18.04 LTS
- Contains
   - Node 10
   - Puppeteer 3.0.2
   - Chromimum 81
- Tested envirnments
    - macOS 10.15.4 
    - Raspbian GNU/Linux 10 (buster)

## Build image

```
docker build -t sylvainleroux/rpi-node-puppeteer .
```

## Run 

```
docker run -i --init --rm --cap-add=SYS_ADMIN    --name rpi-node-puppeteer sylvainleroux/rpi-node-puppeteer  node -e "`cat test_script.js`"
```


## Build 

```
docker buildx build --platform linux/amd64,linux/arm64,linux/arm/v7 -t sylvainleroux/rpi-node-puppeteer:latest --push .  
```