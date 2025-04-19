sudo apt update && sudo apt upgrade -y

# Tải đúng phiên bản executor
wget https://github.com/t3rn/executor-release/releases/download/v0.64.1/executor-linux-v0.64.1.tar.gz

# Giải nén đúng file
tar -xvzf executor-linux-v0.64.1.tar.gz
cd executor

# Thiết lập môi trường
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

# RPC chính xác theo ethers.js v5.8.0
export RPC_ENDPOINTS='{
  "l2rn": ["https://b2n.rpc.caldera.xyz/http"],
  "arbt": [
    "https://arbitrum-sepolia.blockpi.network/v1/rpc/public",
    "https://arbitrum-sepolia.g.alchemy.com/v2/YOUR_API_KEY"
  ],
  "bast": [
    "https://base-sepolia.g.alchemy.com/v2/YOUR_API_KEY",
    "https://base-sepolia.blockpi.network/v1/rpc/public"
  ],
  "blst": [
    "https://sepolia.blast.io",
    "https://blast-sepolia.g.alchemy.com/v2/Z1mDP6LGmaLitFKVJgYnbinXdYvkm5Qd",
    "https://blast-sepolia.g.alchemy.com/v2/0Jho-LFaKw1XJZYGKqYmdxXERGlHWzTD",
    "https://blast-sepolia.g.alchemy.com/v2/IR99_vEaIeiYgLa-A9kj46CViBq0CBs4"
  ],
  "mont": ["https://testnet-rpc.monad.xyz"],
  "opst": [
    "https://sepolia.optimism.io",
    "https://optimism-sepolia.drpc.org"
  ],
  "unit": [
    "https://rpc.testnet.unichain.io",
    "https://unichain-sepolia.blockpi.network/v1/rpc/public"
  ]
}'

export EXECUTOR_PROCESS_PENDING_ORDERS_FROM_API=false

# Chạy executor
cd bin
./executor
