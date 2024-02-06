FROM ubuntu:20.04
LABEL maintainer="dev@anteru.net"
ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update -q && apt-get upgrade -qy && apt-get install -qy make g++-10 python3-pip python3-venv git
RUN update-alternatives --install /usr/bin/gcc gcc /usr/bin/gcc-10 10
RUN update-alternatives --install /usr/bin/g++ g++ /usr/bin/g++-10 10
RUN pip3 install --upgrade pip
RUN apt-get install -qy wget
RUN wget -q https://github.com/Kitware/CMake/releases/download/v3.22.0/cmake-3.22.0-Linux-x86_64.sh
RUN chmod +x cmake-3.22.0-Linux-x86_64.sh
RUN mkdir /opt/cmake
RUN ./cmake-3.22.0-Linux-x86_64.sh --skip-license --prefix=/opt/cmake
RUN rm cmake-3.22.0-Linux-x86_64.sh
