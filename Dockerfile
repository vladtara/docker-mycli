FROM debian:latest

RUN apt-get update &&\
    apt-get install mycli curl -y &&\
    rm -rf /var/lib/apt/lists/*

ENTRYPOINT [ "mycli" ]
CMD [ "--help" ]
