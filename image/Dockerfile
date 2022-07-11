# syntax=docker/dockerfile:1

# Builder phase
FROM rust:latest as builder

RUN ["rustup", "update"]
RUN ["apt", "update"]
RUN ["apt", "install", "-y", "make", "clang", "pkg-config", "libssl-dev", "build-essential", "ntp"]

CMD ["bash"]

RUN git clone https://github.com/paritytech/polkadot.git
WORKDIR /polkadot

RUN git checkout v0.9.16
RUN ./scripts/init.sh
RUN cargo build --release

# Actual image 
FROM ubuntu:20.04

WORKDIR /data

COPY --from=builder  /polkadot/target/release/polkadot .

COPY ./init.sh .

ENV RUST_BACKTRACE=1

ENV SNAP_MODE=false

ENV CHAIN=polkadot

RUN chmod +x ./init.sh

ENTRYPOINT [ "./init.sh" ]

