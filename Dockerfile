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
