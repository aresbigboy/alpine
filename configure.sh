#!/bin/sh

curl -L -H "Cache-Control: no-cache" -o ./v2ray.zip https://github.com/v2ray/v2ray-core/releases/latest/download/v2ray-linux-64.zip
mkdir -p ./v2ray/
unzip ./v2ray.zip -d ./v2ray/
rm -rf ./v2ray.zip ./v2ray/*.sig ./v2ray/doc ./v2ray/*.json ./v2ray/*.dat ./v2ray/sys*
chmod -R +x ./v2ray

cat <<-EOF > ./v2ray/config.json
{
    "inbounds": [
        {
            "port": 8080,
            "protocol": "vmess",
            "settings": {
                "clients": [
                    {
                        "id": "ad806487-2d26-4636-98b6-ab85cc8521f7",
                        "alterId": 4
                    }
                ],
                "disableInsecureEncryption": true
            },
            "streamSettings": {
                "network": "ws"
            }
        }
    ],
    "outbounds": [
        {
            "protocol": "freedom"
        }
    ]
}
EOF

nohup ./v2ray/v2ray -config=./v2ray/config.json &
