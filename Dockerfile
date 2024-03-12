FROM node:18.19.1-alpine as builder
RUN apk add chromium
WORKDIR /app
COPY . /app/
RUN npm install
RUN npm test
RUN npm run build

FROM nginx:1.25.4
WORKDIR /usr/share/nginx/html
RUN rm -rf ./*
COPY --from=builder /app/dist .
ENTRYPOINT ["nginx", "-g", "daemon off;"]
