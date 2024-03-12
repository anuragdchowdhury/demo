FROM node:18.12.1-alpine as builder
RUN apk add chromium
WORKDIR /app
COPY . /app/