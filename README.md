# About polkadot/kusama nodes

## How to launch a full node

1. Download the client: ```curl -sL https://github.com/paritytech/polkadot/releases/download/*VERSION*/polkadot -o polkadot```

Note: you can check the last release [here](https://github.com/paritytech/polkadot/releases).

2. ```Run sudo chmod +x polkadot```

3. Run the following command in order to launch the binary: ```./target/release/polkadot --name "Your Node's Name"```
Also you can specify the chain (default: polkadot) with the flag ```--chain```. 

    ex. ```./target/release/polkadot --name "Your Node's Name" --chain kusama```

4. For archive nodes:

    ```./target/release/polkadot --name "My node's name" --pruning archive```

Note: Use flag ```--wasm-execution Compiled``` to faster sync. Disable after sync is complete

## How to launch a Validator

### Recommended hardware for validator
- CPU - Intel(R) Core(TM) i7-7700K CPU @ 4.20GHz
- Storage - min. 400GB
- Memory - 64GB ECC.

### Instructions
1. Follow steps 1 and 2 from previous section or,
2. Build from binary using this [guide](https://wiki.polkadot.network/docs/maintain-guides-how-to-validate-polkadot).
3. If you want to sync first, launch running:

``` ./target/release/polkadot --pruning=archive ```

Note: if you want to launch in validator mode right away run:

``` ./target/release/polkadot --validator ```

## Update node from binaries

1. Get latest version from paritytech repository

```wget https://github.com/paritytech/polkadot/releases/download/v0.9.19/polkadot -O polkadot.0.9.18```

2. Make file executable

```chmod 777 polkadot.0.9.18```

3. Stop and run the node with new binary (RPC or Validator)

```./target/release/polkadot --pruning=archive```
```./target/release/polkadot --validator```

## How to launch using docker-compose
- Need a .env file to be launched with this docker-compose file.
- Nodes launched with this docker-compose have RPC api enabled by default.
- Snap mode will always look for latest snapshot.

### Env variables
- CHAIN (default to polkadot): polkadot/kusama
- SNAP_MODE (default to false): true/false

## Recommended hardware for validator
- CPU - Intel(R) Core(TM) i7-7700K CPU @ 4.20GHz
- Storage - min. 400GB
- Memory - 64GB ECC.

## Resources
- API docs: https://polkadot.js.org/docs/substrate/rpc
- How to run a validator: https://wiki.polkadot.network/docs/maintain-guides-how-to-validate-polkadot
