FROM ubuntu:20.04

LABEL maintainer="Michele Adduci <adduci@tutanota.com>" \
      license="MIT"

WORKDIR /project

ARG DEB_COMPILERS="g++-10"
ARG EXTRA_CLANG_COMPILERS="9 10 11 12"

RUN echo "Setting up apt " \
         && export DEBIAN_FRONTEND=noninteractive  \
         && apt-get update

RUN echo "Installing required packages " \
         && apt-get install -y \
               wget \
               gnupg2 \
               apt-utils 

RUN echo "Installing C++ Compilers" \
         && apt-get install -y \
               g++-10

RUN echo "Installing libstdc++6" \
         && apt-get install -y \
               libstdc++6

RUN echo "Installing make/cmake" \
         && apt-get install -y \
               make \
               cmake
               
RUN echo "Cleaning up apt " \
         && apt-get autoremove --purge -y \
         && apt-get autoclean -y \
         && rm -rf /var/cache/apt/*

