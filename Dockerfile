FROM ubuntu:18.04

RUN apt-get update 
RUN apt-get install -y curl git wget unzip libgconf-2-4 gdb libstdc++6 libglu1-mesa fonts-droid-fallback lib32stdc++6 python3 apache2 xz-utils zip openjdk-8-jdk
RUN echo "ServerName app.smartnode.in" >> /etc/apache2/apache2.conf
RUN apt-get clean

# download Flutter SDK from Flutter Github repo
RUN git clone https://github.com/flutter/flutter.git -b stable  /usr/local/flutter

# Set flutter environment path
ENV PATH="/usr/local/flutter/bin:${PATH}"

Run flutter channel stable 

RUN flutter doctor

RUN flutter --version

#WORKDIR /app

#COPY . /app

#WORKDIR /app

#RUN flutter pub get

#RUN flutter clean

#RUN flutter build web --release --web-renderer canvaskit

RUN cp -r /app/build/web/* /var/www/html/

CMD apachectl -D FOREGROUND
