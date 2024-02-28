FROM node:21-bookworm-slim
RUN apt-get update
RUN apt-get install chromium -y
ENV PUPPETEER_SKIP_CHROMIUM_DOWNLOAD=true