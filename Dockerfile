FROM build:latest

RUN mkdir -p /home/dev/src
COPY . /home/dev/src/
WORKDIR /home/dev/src/build

RUN cd /home/dev/src/build && cmake .. && make
#RUN chmod +x ./HelloWorld
CMD [ "/home/dev/src/build/HelloWorld" ]
ENTRYPOINT [ "/bin/bash", "-c" ]
