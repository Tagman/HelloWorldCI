FROM debian:stretch

RUN apt update
RUN apt -y upgrade
RUN apt -y install build-essential


RUN mkdir -p /home/tools/
ADD ./cmake-3.9.6.tar.gz /home/tools/
WORKDIR /home/tools/cmake-3.9.6
RUN ./bootstrap
RUN make
RUN make install

WORKDIR /home/

CMD ["/bin/bash"]
