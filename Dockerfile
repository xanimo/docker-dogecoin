ARG ARCH
ARG FLAVOR

# syntax=docker/dockerfile:1
FROM ${ARCH:-"amd64"}/ubuntu:${FLAVOR} AS base
ARG TARGET_HOST

COPY /scripts/base .
COPY /scripts/test .
COPY /packages/${TARGET_HOST} .

# configure shell to use bash
SHELL ["/bin/bash", "-ex", "-o", "pipefail", "-c"]

RUN if [[ $TARGET_HOST == *"-w64-mingw32"* ]] || [[ $TARGET_HOST == *"i686-"* ]]; then \
        dpkg --add-architecture i386; \
    fi

# install arch specific packages
RUN ./base --host=${TARGET_HOST} --docker

# configure *-w64-mingw32 gcc and g++
RUN if [[ $TARGET_HOST == *"-w64-mingw32"* ]]; then \
        dpkg -s mono-runtime && sudo apt-get remove mono-runtime || echo "Very nothing to uninstall."; \
        update-alternatives --set ${TARGET_HOST}-gcc /usr/bin/${TARGET_HOST}-gcc-posix; \
        update-alternatives --set ${TARGET_HOST}-g++ /usr/bin/${TARGET_HOST}-g++-posix; \
        update-binfmts --import /usr/share/binfmts/wine; \
    fi

# build depends with NO_QT to start with
FROM base AS depends
ARG TARGET_HOST

COPY /dogecoin /dogecoin

WORKDIR /dogecoin

RUN make -C depends HOST=${TARGET_HOST} $(source ../$TARGET_HOST; echo $depopts)

# build dogecoin depends
FROM depends AS build
ARG TARGET_HOST

RUN ./autogen.sh
RUN ./configure --prefix=`pwd`/depends/${TARGET_HOST} $(source ../$TARGET_HOST; echo $configopts)

RUN make VERBOSE=1 -j$(nproc)

# functional test suite
FROM build AS test
ARG TARGET_HOST

RUN ./test --host=${TARGET_HOST}
