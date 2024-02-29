FROM ghcr.io/streetsidesoftware/cspell:8.4.1

WORKDIR /app
ENV HOME=/home
RUN npm install @cspell/dict-de-de@3.2.0
RUN cspell-cli link add @cspell/dict-de-de

WORKDIR /workdir
