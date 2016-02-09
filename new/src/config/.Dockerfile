# DO NOT MODIFY
# This file is automatically generated. You can copy this file and add a
# Dockerfile to the root of the project if you would like to use a customer
# docker setup.
FROM node:5.5.0

RUN apt-get update && \
    apt-get -y install libjpeg62-turbo-dev libpango1.0-dev libgif-dev build-essential g++

RUN npm install -g gluestick

RUN mkdir /app
ADD . /app

WORKDIR /app

# This could potentially be done with a dockerignore file but we would need
# code that keeps the docker ignore up to date in all of the projects. For now
# this is easier.
RUN rm -rf node_modules && npm cache clean

RUN npm install

ENV NODE_ENV="production"
ENV ASSET_URL="/assets/"
EXPOSE 8888

CMD ["gluestick", "start", "-T"]

