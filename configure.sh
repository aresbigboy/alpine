#!/bin/sh

cat <<-EOF > ./v2ray/config.json
$CONFIG_JSON
EOF

./v2ray/v2ray -config=./v2ray/config.json
