# x-release-please-start-version
FROM ghcr.io/streetsidesoftware/cspell:10.4.1
# x-release-please-end

WORKDIR /app
ENV HOME=/home
RUN npm install @cspell/dict-de-de@4
RUN cspell-cli link add @cspell/dict-de-de

WORKDIR /workdir
