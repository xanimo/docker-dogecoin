ARG ARCH
ARG FLAVOR

# syntax=docker/dockerfile:1
FROM ${ARCH:-"amd64"}/ubuntu:${FLAVOR} AS base
ARG TARGET_HOST

COPY /scripts/base .
COPY /packages/${TARGET_HOST} .

# configure shell to use bash
SHELL ["/bin/bash", "-ex", "-o", "pipefail", "-c"]

RUN if [[ $TARGET_HOST == *"i686-"* ]]; then \
        dpkg --add-architecture i386; \
    fi

RUN ./base --host=${TARGET_HOST} --docker

# build depends with NO_QT to start with
FROM base AS depends
ARG TARGET_HOST

COPY /dogecoin /dogecoin

WORKDIR /dogecoin

RUN make -C depends HOST=${TARGET_HOST} NO_QT=1

# build dogecoin
FROM depends AS build
ARG TARGET_HOST

RUN ./autogen.sh
RUN ./configure --prefix=`pwd`/depends/${TARGET_HOST} \
    --enable-zmq --enable-glibc-back-compat LDFLAGS=-static-libstdc++
RUN make check VERBOSE=1 -j4
RUN make -C src check-security
RUN make -C src check-symbols

# functional test suite
FROM build AS test
RUN apt-get update \
    && apt-get install -y --no-install-recommends \
    curl gcc python3-pip python3-setuptools python3-zmq
RUN ./qa/pull-tester/install-deps.sh