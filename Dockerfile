FROM buildpack-deps:jammy

RUN groupadd --gid 1000 node \
  && useradd --uid 1000 --gid node --shell /bin/bash --create-home node

ENV NODE_VERSION 20.11

RUN apt update && apt install curl 
RUN curl -fsSL https://deb.nodesource.com/setup_21.x | bash -
RUN apt install -y nodejs

RUN apt-get update && \
  apt-get -y install xvfb gconf-service libasound2 libatk1.0-0 libc6 libcairo2 libcups2 \
  libdbus-1-3 libexpat1 libfontconfig1 libgbm1 libgcc1 libgconf-2-4 libgdk-pixbuf2.0-0 libglib2.0-0 \
  libgtk-3-0 libnspr4 libpango-1.0-0 libpangocairo-1.0-0 libstdc++6 libx11-6 libx11-xcb1 libxcb1 \
  libxcomposite1 libxcursor1 libxdamage1 libxext6 libxfixes3 libxi6 libxrandr2 libxrender1 libxss1 \
  libxtst6 ca-certificates fonts-liberation libappindicator1 libnss3 lsb-release xdg-utils wget snapd && \
  rm -rf /var/lib/apt/lists/*

COPY ./debian.list /etc/apt/sources.list.d/debian.list
COPY ./chromium.prefs /etc/apt/preferences.d/chromium.pref

RUN apt-key adv --keyserver keyserver.ubuntu.com --recv-keys DCC9EFBF77E11517 && \
  apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 648ACFD622F3D138 && \
  apt-key adv --keyserver keyserver.ubuntu.com --recv-keys AA8E81B4331F7F50 && \
  apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 112695A0E562B32A

RUN apt update && apt install -y chromium

WORKDIR /app
RUN npm i puppeteer
  # Add user so we don't need --no-sandbox.
  # same layer as npm install to keep re-chowned files from using up several hundred MBs more space
RUN groupadd -r pptruser && useradd -r -g pptruser -G audio,video pptruser \
  && mkdir -p /home/pptruser/Downloads \
  && chown -R pptruser:pptruser /home/pptruser \
  && chown -R pptruser:pptruser /app/node_modules

# Run everything after as non-privileged user.
USER pptruser