FROM debian:bullseye-slim
RUN apt-get update && \
    apt-get install -y \
        build-essential \
        python3 && \
    rm -rf /var/lib/apt/lists/*

ADD https://github.com/EddyRivasLab/hmmer/archive/refs/tags/hmmer-3.3.2.tar.gz .
RUN tar zxf hmmer-3.3.2.tar.gz

WORKDIR hmmer-3.3.2
RUN autoconf && \
    ./configure --prefix /usr/local && \
    make && \
    make install

WORKDIR easel
RUN make install
