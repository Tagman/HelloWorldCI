FROM build:latest

RUN apt update && apt -y upgrade && \
    apt -y install git-all && \
    apt -y install lcov && \
    apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

#RUN groupadd -r -g 1000 dev && useradd -r -m -u 1000 -g dev dev


#RUN mkdir -p /home/dev/src
#COPY . /home/dev/src/
#WORKDIR /home/dev/src/build

#RUN chown -R dev:dev /home/dev/


#RUN cd /home/dev/src/build/debug && cmake ../.. && make HelloWorld

CMD ["/bin/bash"]

