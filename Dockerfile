#FROM ubuntu:18.04

# Prerequisites
#RUN apt update && apt install -y curl git unzip xz-utils zip libglu1-mesa openjdk-8-jdk wget apache2

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
#RUN git clone https://github.com/flutter/flutter.git -b flutter-3.7-candidate.8 /usr/local/flutter
 
#ENV PATH="/usr/local/flutter/bin:${PATH}"

# Run basic check to download Dark SDK
#RUN flutter doctor

# Install Operating system and dependencies
#FROM ubuntu:18.04

#RUN apt-get update 
#RUN apt install -y curl git unzip xz-utils zip libglu1-mesa openjdk-8-jdk wget
#RUN apt-get install -y curl git wget unzip libgconf-2-4 gdb libstdc++6 libglu1-mesa fonts-droid-fallback lib32stdc++6 python3 apache2
#RUN apt-get clean

# download Flutter SDK from Flutter Github repo
#RUN git clone https://github.com/flutter/flutter.git -b flutter-3.7-candidate.8 /usr/local/flutter

# Set flutter environment path
#ENV PATH="/usr/local/flutter/bin:/usr/local/flutter/bin/cache/dart-sdk/bin:${PATH}"

# Run flutter doctor
#RUN flutter doctor


FROM ubuntu:18.04

# Install required packages
RUN apt-get update && \
    apt-get install -y curl git unzip xz-utils zip libglu1-mesa openjdk-8-jdk wget apache2
    apt-get update && \
    apt-get install -y curl git unzip xz-utils zip libglu1-mesa openjdk-8-jdk wget

# Set the working directory to /app
#WORKDIR /app

# Install Flutter
  RUN wget -q https://storage.googleapis.com/flutter_infra/releases/stable/linux/flutter_linux_2.5.3-stable.tar.xz && \
# wget -q https://storage.googleapis.com/flutter_infra_release/releases/stable/linux/flutter_linux_3.7.8-stable.tar.xz && \
    tar xf flutter_linux_3.7.8-stable.tar.xz && \
    rm flutter_linux_3.7.8-stable.tar.xz
    

# Add Flutter to the path
ENV PATH=$PATH:/app/flutter/bin

# Run Flutter doctor to verify installation
RUN flutter doctor

# Copy the project to the container's /app directory
#COPY . /app

# Run the Flutter app
#CMD ["flutter", "run"]
