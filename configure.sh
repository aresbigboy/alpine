#!/bin/sh

cat <<-EOF > ./config.json
$CONFIG_JSON
EOF

./v2ray -config=./config.json
