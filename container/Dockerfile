FROM rust:1.52

RUN apt-get -y update && \
     apt install --no-install-recommends -y cmake clang python3-pip  && \
     apt-get upgrade -y && \
     rm -rf /var/lib/apt/lists/*

RUN pip3 install asn1

