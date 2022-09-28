# syntax=docker/dockerfile:1

# Builder phase
FROM ubuntu:22.04 as builder

RUN ["apt", "update"]
RUN ["apt", "install", "-y", "wget"]

CMD ["bash"]

RUN wget https://github.com/paritytech/polkadot/releases/download/v0.9.29/polkadot

# Running image 
FROM ubuntu:22.04

WORKDIR /data

COPY --from=builder  /polkadot .
RUN chmod +x ./polkadot

ENV RUST_BACKTRACE=1
ENV SNAP_MODE=false
ENV CHAIN=polkadot

COPY ./init.sh .
RUN chmod +x ./init.sh

ENTRYPOINT [ "./init.sh" ]
