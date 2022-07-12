FROM ubuntu:22.04

WORKDIR /data

RUN ["wget", "https://github.com/paritytech/polkadot/releases/download/v0.9.25/polkadot"]
RUN ["chmod", "+x", "./polkadot"]

ENV RUST_BACKTRACE=1
ENV SNAP_MODE=false
ENV CHAIN=polkadot

COPY ./init.sh .
RUN chmod +x ./init.sh

ENTRYPOINT [ "./init.sh" ]
