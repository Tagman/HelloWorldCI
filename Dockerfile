FROM build:latest

RUN groupadd -r -g 1000 dev
RUN useradd -r -m -u 1000 -g dev dev


RUN mkdir -p /home/dev/src
COPY . /home/dev/src/
WORKDIR /home/dev/src/build

RUN chown -R dev:dev /home/dev/


RUN cd /home/dev/src/build && cmake .. && make

