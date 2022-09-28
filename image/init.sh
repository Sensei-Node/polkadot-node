#!/bin/bash
echo " Chain detected is: $CHAIN"
if [ "$SNAP_MODE" == "true" -a ! -f ./.snapmode ]; then
    echo "snap mode detected"
    cat > .snapmode
    # pre-launch phase to let node create folder structure
    ./polkadot --chain=$CHAIN  --pruning=archive &
    node_pid=$!

    echo "Node PID is ${node_pid}"

    #Waiting 10 s
    sleep 20
    # Gracefully kill polkadot
    kill $node_pid

    # Check if polkadot db directory was created by node
    wait $!
    DB_DIR=$([[ "$CHAIN" == "polkadot" ]] && echo "/root/.local/share/polkadot/chains/polkadot/" || echo "/root/.local/share/polkadot/chains/ksmcc3/")
    if [ -d "$DB_DIR" ]; then
        echo "DB directory exist."
        apt update && apt install -y liblz4-tool wget && apt clean
        echo "Downloading snapshot. This can take several minutes"
        chain=$([[ "$CHAIN" == "polkadot" ]] && echo "dot" || echo "ksm")
        wget -O- --no-verbose --show-progress --progress=dot:giga https://$chain-rocksdb.polkashots.io/snapshot | lz4 -c -v -d - | tar -x -C $DB_DIR
        ./polkadot --chain=$CHAIN --database=RocksDb --unsafe-pruning --pruning=1000 --rpc-external --ws-external --rpc-cors=all
        if [ "$?" == "1" ]; then
            echo "A problem ocurred when trying to download snapshot"
            rm .snapmode
            exit 1
        fi
    else
        echo "DB directory doesn't exist."
        echo "launching as no-snapshot node"
        rm .snapmode
        ./polkadot --chain=$CHAIN --database=RocksDb --unsafe-pruning --pruning=1000 --rpc-external --ws-external --rpc-cors=all
        exit 0
    fi
else
    if [ -f ./.snapmode ]; then
        echo "Snapshot was taken from backup. Launching as a snapshoot node..."
        ./polkadot --chain=$CHAIN --database=RocksDb --unsafe-pruning --pruning=1000 --rpc-external --ws-external --rpc-cors=all
    else
        echo "launching as no-snapshot node"
        ./polkadot --chain=$CHAIN --pruning=archive --rpc-external --ws-external --rpc-cors=all
    fi
fi