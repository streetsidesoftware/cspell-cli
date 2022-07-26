FROM node:16.16.0

WORKDIR /app
COPY package-lock.json package.json index.js ./
RUN npm install --production
RUN npm install --global

WORKDIR /workdir
ENTRYPOINT [ "cspell-cli" ]
