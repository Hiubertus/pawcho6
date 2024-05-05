FROM node:alpine AS builder

ARG VERSION

WORKDIR /app

COPY app.js .

ENV APP_VERSION=$VERSION

FROM nginx:stable-alpine3.17-slim

RUN apk add --no-cache npm curl

WORKDIR /app

COPY --from=builder /app .

COPY ./nginx.conf /etc/nginx/conf.d/default.conf

EXPOSE 8080

HEALTHCHECK --interval=30s --timeout=10s --start-period=5s --retries=3 \
  CMD curl -f http://localhost/ || exit 1

CMD ["node", "app.js"]