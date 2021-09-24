FROM ubuntu:18.04
RUN apt-get update && apt-get install -y python3 wget build-essential

RUN wget http://eddylab.org/software/hmmer/hmmer.tar.gz
RUN tar zxf hmmer.tar.gz
WORKDIR hmmer-3.3.2
RUN ./configure --prefix /usr/local
RUN make
RUN make install
RUN cd easel; make install