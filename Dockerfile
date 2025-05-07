FROM node:22-alpine

WORKDIR /app
ENV HOME=/home
COPY package-lock.json package.json index.js ./
RUN npm ci --omit=dev
RUN npm install --location=global

WORKDIR /workdir
ENTRYPOINT [ "cspell-cli" ]
