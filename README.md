# Overview

This image is intended to quickly launch a Polkadot or Kusama node from a snapshot for fast syncing. 

### Env variables
- CHAIN (defaults to polkadot): polkadot/kusama
- SNAP_MODE (defaults to false): true/false

Important: This image always downloads the protocol client from the official Parity repository.

## How to launch using docker-compose
- Need to specify the env variables inside the docker-compose file.
- Nodes launched with this docker-compose have RPC api enabled by default.
- Snap mode will always look for latest snapshot.

## Resources
- API docs: https://polkadot.js.org/docs/substrate/rpc
