sudo apt update && sudo apt upgrade -y
wget https://github.com/t3rn/executor-release/releases/download/v0.63.1/executor-linux-v0.63.1.tar.gz
tar -xvzf executor-linux-v0.63.1.tar.gz
cd executor

export ENVIRONMENT=testnet
export LOG_LEVEL=debug
export LOG_PRETTY=false
export EXECUTOR_PROCESS_BIDS_ENABLED=true
export EXECUTOR_PROCESS_ORDERS_ENABLED=true
export EXECUTOR_PROCESS_CLAIMS_ENABLED=true
export EXECUTOR_PROCESS_ORDERS=true
export EXECUTOR_PROCESS_CLAIMS=true
export EXECUTOR_MAX_L3_GAS_PRICE=100
export PRIVATE_KEY_LOCAL=$(cat key.txt)
export ENABLED_NETWORKS='arbitrum-sepolia,base-sepolia,optimism-sepolia,l2rn,blast-sepolia,unichain-sepolia,monad-testnet'
export RPC_ENDPOINTS='{
    "l2rn": ["https://b2n.rpc.caldera.xyz/http"],
    "arbt": ["https://arb-sepolia.g.alchemy.com/v2/0Jho-LFaKw1XJZYGKqYmdxXERGlHWzTD", "https://arb-sepolia.g.alchemy.com/v2/IR99_vEaIeiYgLa-A9kj46CViBq0CBs4"],
    "bast": ["https://base-sepolia.g.alchemy.com/v2/0Jho-LFaKw1XJZYGKqYmdxXERGlHWzTD", "https://base-sepolia.g.alchemy.com/v2/IR99_vEaIeiYgLa-A9kj46CViBq0CBs4"],
    "blst": ["https://blast-sepolia.g.alchemy.com/v2/0Jho-LFaKw1XJZYGKqYmdxXERGlHWzTD", "https://blast-sepolia.g.alchemy.com/v2/Z1mDP6LGmaLitFKVJgYnbinXdYvkm5Qd", "https://blast-sepolia.g.alchemy.com/v2/IR99_vEaIeiYgLa-A9kj46CViBq0CBs4"],
    "mont": ["https://testnet-rpc.monad.xyz","https://monad-testnet.g.alchemy.com/v2/Vn0Mwfi1lAU_BnWlOem8aO-I6uhaSwTq],
    "opst": ["https://sepolia.optimism.io", "https://optimism-sepolia.drpc.org"],
    "unit": ["https://unichain-sepolia.g.alchemy.com/v2/0Jho-LFaKw1XJZYGKqYmdxXERGlHWzTD", "https://unichain-sepolia.api.onfinality.io/public","https://unichain-sepolia.drpc.org", "https://sepolia.unichain.org"]
}'
export EXECUTOR_PROCESS_PENDING_ORDERS_FROM_API=false

cd executor/bin
./executor
