# Use offical Node.js image.  The image uses Apline Linux
FROM arm32v7/node:12.18.4-alpine

# Build-time metadata as defined at https://github.com/opencontainers/image-spec/blob/master/annotations.md
ARG BUILD_DATE
ARG DOCKER_TAG
ARG GIT_SHA

LABEL org.opencontainers.image.created=$BUILD_DATE \
  org.opencontainers.image.authors="Chad Hutchins" \
  org.opencontainers.image.url="https://github.com/chadhutchins182/route53-dynamic-dns" \
  org.opencontainers.image.documentation="https://github.com/chadhutchins182/route53-dynamic-dns" \
  org.opencontainers.image.source="https://github.com/chadhutchins182/route53-dynamic-dns" \
  org.opencontainers.image.version=$DOCKER_TAG \
  org.opencontainers.image.revision=$GIT_SHA \
  org.opencontainers.image.vendor="chadhutchins182" \
  org.opencontainers.image.licenses="MIT" \
  org.opencontainers.image.ref.name="" \
  org.opencontainers.image.title="route53-dynamic-dns-arm32v7" \
  org.opencontainers.image.description="Update AWS Route53 hosted zone with current public IP address. Alternative to Dynamic DNS services such as Dyn, No-IP, etc"

# Create app directory
#RUN mkdir -p /usr/src/app
WORKDIR /usr/src/app

# Install app dependencies
COPY package.json /usr/src/app/
RUN npm install

# Bundle app source
COPY . /usr/src/app

# Run server.js every 30 seconds
CMD ["npm", "start"]
