FROM nginx:latest
LABEL maintainer="RyanLafferty"

RUN mkdir /nginx
WORKDIR /nginx

COPY config/nginx/dev/uwsgi_params /nginx/
COPY config/nginx/dev/nginx-app.conf /etc/nginx/conf.d/default.conf

EXPOSE 8080
ENTRYPOINT ["nginx", "-g", "daemon off;"]