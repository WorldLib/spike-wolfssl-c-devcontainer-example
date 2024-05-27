ARG __variant="3"
FROM alpine:${__variant}

ARG __group_name=vscode
ARG __group_uid=1000
ARG __user_name=vscode
ARG __user_uid=1000
ARG __workspace=/workspaces/this-project

ENV WORKSPACE_HOME=${__workspace}

RUN apk update --no-cache && \
    apk upgrade --no-cache && \
    apk add --no-cache \
        autoconf \
        automake \
        bash \
        cppcheck \
        flawfinder \
        gcc \
        gdb \
        git \
        libtool \
        make \
        musl-dev \
        util-linux \
    && addgroup -g ${__group_uid} ${__group_name} \
    && adduser -D -u ${__user_uid} -G ${__group_name} --disabled-password ${__user_name}
RUN mkdir -p ${__workspace} /src \
    && chown -R ${__user_name}:${__group_name} ${__workspace} \
    && git clone -b master --depth 1 https://github.com/wolfSSL/wolfssl.git /src/wolfssl
WORKDIR /src/wolfssl
RUN ./autogen.sh >/src/01.autogen.txt 2>/src/01.autogen.err \
    || echo "autogen result: $?" >> /src/session.log
RUN ./configure --enable-debug >/src/02.configure.txt 2>/src/02.configure.err \
    || echo "configure result: $?" >> /src/session.log
RUN make >/src/03.make.txt 2>/src/03.make.err \
    || echo "make result: $?" >> /src/session.log
RUN make check >/src/04.make_check.txt 2>/src/04.make_check.err \
    || echo "make check result: $?" >> /src/session.log
RUN make install >/src/05.make_install.txt 2>/src/05.make_install.err \
    || echo "make install result: $?" >> /src/session.log
    
USER ${__user_name}

WORKDIR ${__workspace}
