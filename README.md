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

Result:

````{"jsonrpc":"2.0","result":{"digest":{"logs":["0x0642414245b5010122000000c2eca50f0000000064cf4eefec2a6c9e5b8f00e278ab75a4e38230a58cd7fa1ecb5fd2caf0a7d06fb3912c8ae13ab500f182bb3e3df3268fc163fc7104f16732ef4273a643bde007e5e30c84ae9d1d227a4ee992bee7fb808c2bf63dd1f079df32605cb5b9b9040f","0x0542414245010114d20f5b7ee26b75b27121b05c69479343d95c91b5c1823154dc41671cb7f965a571d2e6845539abe0e60c0a197dd2a3f0a50d21d8a3d3b413684dc33664ac88"]},"extrinsicsRoot":"0x7ce9ffdc5a57fe99e043c4b1d0a05bb7521eff11911c0be2a8275b63636e9228","number":"0x93c0","parentHash":"0xb0640392538945c55c9c3d8dc114714a9eec709a81f09dcf667f0fc795596c98","stateRoot":"0x2d0b3427941a5ca873ead20e3b3a6d0d0cb0f967d94b92239e4fe54fffe68d49"},"id":1}````

The block height is specified as "number" and is expressed in hex format, use a [hex convertor](https://www.rapidtables.com/convert/number/hex-to-decimal.html) to find out the int number. 

If you are installing from snapshot the connection will be refused until the node finishes downloading and extracting the blockchain database. 

## Notes
- Need to specify the env variables inside the docker-compose file.
- Nodes launched with this docker-compose have RPC api enabled by default.
- Snap mode will always look for latest snapshot.
- Important: This image always downloads the protocol client from the official Parity repository.

## Resources
- API docs: https://polkadot.js.org/docs/substrate/rpc
