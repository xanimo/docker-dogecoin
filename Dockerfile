FROM ubuntu:20.04 AS deps

RUN apt-get update
RUN DEBIAN_FRONTEND=noninteractive \
    apt-get install -y \
    build-essential \
    libtool-bin \
    autotools-dev \
    automake \
    pkg-config \
    bsdmainutils \
    curl \
    ca-certificates \
    ccache \
    cmake \
    imagemagick \
    libcap-dev \
    librsvg2-bin \
    libz-dev \
    libtiff-tools \
    libtinfo5 \
    python-is-python3 \
    python3-setuptools \
    wget \
    xorriso \
    libtinfo5 \
    libbz2-dev \
    python3 \
    rsync \
    procps \
    bison

FROM deps

COPY /dogecoin /dogecoin

WORKDIR /dogecoin

RUN make -C depends HOST=x86_64-apple-darwin11 NO_QT=1
