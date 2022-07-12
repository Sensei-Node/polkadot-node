# Overview
This image is intended to launch Polkadot/Kusama Full RPC Nodes with or without snapshot. This is important because you only need to set a couple of Env. variables in order to download the snapshot or change the blockchain saving you configuration time.

Important: This image always download client's and/or snapshot's from official sources. 
## How to launch using docker-compose
- Need to specify a .env or set Env. variables inside compose file.
- Nodes launched with this docker-compose have RPC api enabled by default.
- Snap mode will always look for latest snapshot.

### Env variables
- CHAIN (default to polkadot): polkadot/kusama
- SNAP_MODE (default to false): true/false

## Resources
- API docs: https://polkadot.js.org/docs/substrate/rpc
