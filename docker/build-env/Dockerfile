FROM debian:stretch

RUN apt update && apt -y upgrade && \
    apt -y install build-essential && \
    apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*


RUN mkdir -p /home/tools/
ADD ./cmake-3.9.6.tar.gz /home/tools/
WORKDIR /home/tools/cmake-3.9.6
RUN ./bootstrap && make && make install

WORKDIR /home/

CMD ["/bin/bash"]
