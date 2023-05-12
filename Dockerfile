FROM ubuntu:18.04
RUN apt update && apt install -y curl openjdk-8-jdk wget apache2 git 2.x unzip which xz-utils zip libglu1-mesa 
RUN wget https://storage.googleapis.com/flutter_infra_release/releases/stable/linux/flutter_linux_3.7.12-stable.tar.xz /usr/local/flutter
RUN cd /usr/local/flutter/
RUN tar xf /usr/local/flutter/flutter_linux_3.10.0-stable.tar.xz
ENV PATH="/usr/local/flutter/bin:${PATH}"
RUN flutter doctor
RUN flutter --version
