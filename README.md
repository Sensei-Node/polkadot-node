# Overview

This image is intended to quickly launch a Polkadot or Kusama node from a snapshot for fast syncing. 

## Recommended hardware
- CPU - Intel(R) Core(TM) i7-7700K CPU @ 4.20GHz
- Storage - min. 500GB
- Memory - 32GB

### Env variables
- CHAIN (defaults to polkadot): polkadot/kusama
- SNAP_MODE (defaults to true): true/false

Important: This image always downloads the protocol client from the official Parity repository.

## How to launch using docker-compose
- Need to specify the env variables inside the docker-compose file.
- Nodes launched with this docker-compose have RPC api enabled by default.
- Snap mode will always look for latest snapshot.

## Resources
- API docs: https://polkadot.js.org/docs/substrate/rpc
