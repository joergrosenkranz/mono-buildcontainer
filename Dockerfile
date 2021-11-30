# docker build -t monobuild .
# docker run --rm -it monobuild

FROM mono:latest
RUN set -xe \
    && apt-get update \
    && apt-get upgrade -q -y \
    && apt-get install -q -y git autoconf libtool automake build-essential gettext cmake python3 curl \
    && rm -rf /var/lib/apt/lists/*

 RUN mkdir /src && cd /src && git clone https://github.com/mono/mono.git

WORKDIR /src/mono

RUN ./autogen.sh

CMD [ "bash" ]