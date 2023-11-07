FROM node:18-alpine

WORKDIR /app
COPY package-lock.json package.json index.js ./
RUN npm ci --omit=dev
RUN npm install --global

WORKDIR /workdir
ENTRYPOINT [ "cspell-cli" ]
