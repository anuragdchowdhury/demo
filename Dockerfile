FROM node:18.19.1-alpine as builder
RUN apk add chromium
WORKDIR /app
COPY . /app/
RUN chrome -v
RUN npm install
RUN npm test
# RUN npm run build