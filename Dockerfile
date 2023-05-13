#FROM ubuntu:18.04
FROM alpine:latest
RUN apk update && apk upgrade && reboot
RUN apk add --no-cache mesa-gl git gzip apache2 xz zip openjdk8-jre bash curl tar 
#RUN apt-get update 
#RUN apt-get install -y git libglu1-mesa apache2 xz-utils zip openjdk-8-jdk curl
RUN echo "ServerName app.smartnode.in" >> /etc/apache2/apache2.conf
#RUN apt-get clean

# download Flutter SDK from Flutter Github repo
RUN git clone https://github.com/flutter/flutter.git -b stable  /usr/local/flutter

# Set flutter environment path
ENV PATH="/usr/local/flutter/bin:${PATH}"

#Run flutter channel stable 
RUN flutter clean
RUN flutter pub upgrade
RUN flutter doctor

RUN flutter --version

#WORKDIR /app

#COPY . /app

#WORKDIR /app

#RUN flutter pub get

#RUN flutter clean

#RUN flutter build web --release --web-renderer canvaskit

#RUN cp -r /app/build/web/* /var/www/html/

#CMD apachectl -D FOREGROUND
