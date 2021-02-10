FROM ubuntu:20.04

# data Folder
VOLUME /data

# Port for nerva
EXPOSE 8888

ENV DEBIAN_FRONTEND noninteractive

# Ok lets install everything
RUN apt update && \
apt install -y wget unzip && \
mkdir /app && \
cd /app && \
wget https://bitbucket.org/nerva-xnv/nerva/downloads/nerva-v0.1.7.3_linux_minimal.zip && \
unzip nerva*.zip && \
rm *.zip && \
wget https://bitbucket.org/nerva-xnv/nerva/downloads/quicksync.raw

WORKDIR /app

ENTRYPOINT ["nervad"]

# Default config
CMD [ "--data-dir", "/data"]
