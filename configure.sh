#!/bin/sh
# V2Ray new configuration
cat <<-EOF > ./config.json
$CONFIG_JSON
EOF
# Run V2Ray
./v2ray/v2ray -config=./config.json
