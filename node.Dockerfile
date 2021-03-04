FROM ubuntu:20.04

# data Folder
VOLUME /data

# Port for nerva
EXPOSE 17565 18565

ENV DEBIAN_FRONTEND noninteractive

# Ok lets install everything
RUN apt update && \
ln -fs /usr/share/zoneinfo/UTC /etc/localtime && \
apt install -y wget unzip && \
mkdir /app && \
cd /app && \
wget -q https://bitbucket.org/nerva-xnv/nerva/downloads/nerva-v0.1.7.3_linux_minimal.zip && \
unzip nerva*.zip && \
rm *.zip && \
chmod 755 nerva* && \
wget -q https://bitbucket.org/nerva-xnv/nerva/downloads/quicksync.raw

WORKDIR /app

ENTRYPOINT ["./nervad"]

# Default config
CMD [ "--data-dir", "/data", "--public-node", "--restricted-rpc"]
