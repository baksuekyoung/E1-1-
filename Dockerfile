FROM nginx:alpine
LABEL org.opencontainers.image.title="my-custom-web-server"
ENV APP_ENV=dev
COPY index.html /usr/share/nginx/html/