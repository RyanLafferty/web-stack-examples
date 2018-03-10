FROM ubuntu:latest
LABEL maintainer="RyanLafferty"

RUN apt-get update && apt-get install -y curl
RUN curl -sL https://deb.nodesource.com/setup_9.x | /bin/bash && apt-get install -y nodejs

WORKDIR /app
COPY ./app/package.json ./
RUN npm install
RUN npm install nodemon -g

ADD ./app .

EXPOSE 8080
CMD ["nodemon", "start"]