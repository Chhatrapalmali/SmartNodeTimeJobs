# Stage 1
FROM ubuntu:latest AS build-env

RUN apt-get update 
RUN apt-get install -y curl git wget unzip libgconf-2-4 gdb libstdc++6 libglu1-mesa fonts-droid-fallback lib32stdc++6 
RUN apt-get clean

RUN git clone https://github.com/flutter/flutter.git -b stable /usr/local/flutter

ENV PATH="/usr/local/flutter/bin:/usr/local/flutter/bin/cache/dart-sdk/bin:${PATH}"

RUN flutter doctor -v

RUN flutter channel stable
RUN flutter upgrade
RUN flutter config --enable-web

#RUN mkdir /app/
#COPY . /app/
#WORKDIR /app/
#RUN flutter build web

# Stage 2
#FROM nginx:1.21.1-alpine
#COPY --from=build-env /app/build/web /usr/share/nginx/html




#FROM ubuntu:18.04



#FROM alpine:latest

# Install dependencies
#RUN apk add --no-cache bash git openssh dart-sdk \
 # curl \
 # wget \
  #unzip \
 # xz \
 # libstdc++

# Create non-root user
#RUN addgroup -S appgroup && adduser -S appuser -G appgroup
#USER appuser

# Clone flutter repository
#RUN git clone https://github.com/flutter/flutter.git -b stable /usr/local/flutter && \
  #  export PATH=$PATH:/usr/local/flutter/bin 
   # RUN ls && \
   # flutter precache && \
   # flutter config --no-analytics && \
   # flutter doctor

# Set environment variables
#ENV PATH="/usr/local/flutter/bin:${PATH}"

# Copy app source code to container
#COPY . /app
#RUN ls
# Install app dependencies
#RUN cd /app && \
# RUN flutter packages get
# RUN flutter --version

# Build the app
#RUN cd /app && \
  #flutter build apk --release

# Set the default command to run when the container starts
#CMD ["flutter", "run", "--release", "-d", "web-server"]






#FROM ubuntu:18.04
#FROM alpine:latest
#RUN apk update && apk upgrade 
#RUN apk add --no-cache mesa-gl git gzip apache2 xz zip openjdk8-jre bash curl tar 
#RUN apt-get update 
#RUN apt-get install -y git libglu1-mesa apache2 xz-utils zip openjdk-8-jdk curl
#RUN echo "ServerName app.smartnode.in" >> /etc/apache2/apache2.conf
#RUN apt-get clean

# download Flutter SDK from Flutter Github repo
#RUN pwd

#RUN git clone https://github.com/flutter/flutter.git -b stable 
 
# Set flutter environment path
#ENV FLUTTER_HOME=/opt/flutter PUB_CACHE=/var/tmp/.pub_cache FLUTTER_ROOT=/opt/flutter PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/opt/flutter/bin:/var/tmp/.pub_cache/bin
#ENV export PATH="$PATH:`pwd`/flutter/bin"
#RUN pwd
#Run flutter channel stable 

#RUN flutter pub upgrade
#RUN flutter clean
#RUN flutter doctor

#RUN flutter --version

#WORKDIR /app

#COPY . /app

#WORKDIR /app

#RUN flutter pub get

#RUN flutter clean

#RUN flutter build web --release --web-renderer canvaskit

#RUN cp -r /app/build/web/* /var/www/html/

#CMD apachectl -D FOREGROUND
