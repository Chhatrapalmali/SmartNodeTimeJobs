#FROM ubuntu:18.04

# Prerequisites
#RUN apt update && apt install -y curl git unzip xz-utils zip libglu1-mesa openjdk-8-jdk wget

# Set up new user
#RUN useradd -ms /bin/bash developer
#USER developer
#WORKDIR /home/developer

# Prepare Android directories and system variables
#RUN mkdir -p Android/sdk
#ENV ANDROID_SDK_ROOT /home/developer/Android/sdk
#RUN mkdir -p .android && touch .android/repositories.cfg

# Set up Android SDK
#RUN wget -O sdk-tools.zip https://dl.google.com/android/repository/sdk-tools-linux-4333796.zip
#RUN unzip sdk-tools.zip && rm sdk-tools.zip
#RUN mv tools Android/sdk/tools
#RUN cd Android/sdk/tools/bin && yes | ./sdkmanager --licenses
#RUN cd Android/sdk/tools/bin && ./sdkmanager "build-tools;29.0.2" "patcher;v4" "platform-tools" "platforms;android-29" "sources;android-29"
#ENV PATH "$PATH:/home/developer/Android/sdk/platform-tools"

# Download Flutter SDK
#RUN git clone https://github.com/flutter/flutter.git /usr/local/flutter
#ENV PATH="/usr/local/flutter/bin:${PATH}"

# Run basic check to download Dark SDK
#RUN flutter doctor

# Install Operating system and dependencies
FROM ubuntu:20.04

RUN apt-get update 
RUN apt install -y curl git unzip xz-utils zip libglu1-mesa openjdk-8-jdk wget
#RUN apt-get install -y curl git wget unzip libgconf-2-4 gdb libstdc++6 libglu1-mesa fonts-droid-fallback lib32stdc++6 python3
RUN apt-get clean

# download Flutter SDK from Flutter Github repo
RUN git clone https://github.com/flutter/flutter.git /usr/local/flutter

# Set flutter environment path
ENV PATH="/usr/local/flutter/bin:/usr/local/flutter/bin/cache/dart-sdk/bin:${PATH}"

# Run flutter doctor
RUN flutter doctor
