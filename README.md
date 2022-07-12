# Overview

This image is intended to quickly launch a Polkadot or Kusama node from a snapshot for fast syncing. 

## Recommended hardware
- CPU - Intel(R) Core(TM) i7-7700K CPU @ 4.20GHz
- Storage - min. 500GB
- Memory - 32GB

### Env variables
- CHAIN (defaults to polkadot): polkadot/kusama
- SNAP_MODE (defaults to true): true/false

## Quickstart (3 steps).

    git clone https://github.com/Sensei-Node/polkadot-node
    cd polkadot-node
    docker-compose up -d

Check if you are synced to the network with the following curl command:

    curl --location --request POST 'localhost:9933' --header 'Content-Type: application/json' --data-raw '{"id":1, "jsonrpc":"2.0", "method": "chain_getHeader"}'

If you are installing from snapshot the connection will be refused until the node finishes downloading and extracting the blockchain database. 

## Notes
- Need to specify the env variables inside the docker-compose file.
- Nodes launched with this docker-compose have RPC api enabled by default.
- Snap mode will always look for latest snapshot.
- Important: This image always downloads the protocol client from the official Parity repository.

## Resources
- API docs: https://polkadot.js.org/docs/substrate/rpc
