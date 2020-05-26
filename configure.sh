#!/bin/sh

curl -L -H "Cache-Control: no-cache" -o ./v2ray.zip https://github.com/v2ray/v2ray-core/releases/latest/download/v2ray-linux-64.zip
mkdir -p ./v2ray/
unzip ./v2ray.zip -d ./v2ray/
rm -rf ./v2ray.zip ./v2ray/*.sig ./v2ray/doc ./v2ray/*.json ./v2ray/*.dat ./v2ray/sys*
chmod -R +x ./v2ray

cat <<-EOF > ./v2ray/config.json
$CONFIG_JSON
EOF

./v2ray/v2ray -config=./v2ray/config.json
