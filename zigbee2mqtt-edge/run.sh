#!/bin/bash

CONFIG_PATH=/data/options.json

DATA_PATH=$(jq --raw-output ".data_path" $CONFIG_PATH)
DEBUG=""
ZIGBEE_HERDSMAN_DEBUG=$(jq --raw-output ".zigbee_herdsman_debug // empty" $CONFIG_PATH)
ZIGBEE_SHEPHERD_DEVICES=$(jq --raw-output ".zigbee_shepherd_devices // empty" $CONFIG_PATH)

echo "Debug information"
echo $ZIGBEE_HERDSMAN_DEBUG
echo "-----"
echo $ZIGBEE_SHEPHERD_DEVICES
echo "-----"
cat $CONFIG_PATH
echo "Debug information end"

# Check if config exists already
if [[ -f $DATA_PATH/configuration.yaml ]]; then
    if [[ ! -f $DATA_PATH/.configuration.yaml.bk ]]; then
        echo "[Info] Configuration file found in data path, but no backup file found in data path. Backing up existing configuration to ${DATA_PATH}/.configuration.yaml.bk"
        cp $DATA_PATH/configuration.yaml $DATA_PATH/.configuration.yaml.bk
    else
        "[Info] Configuration backup found in ${DATA_PATH}/.configuration.yaml.bk. Skipping config backup."
    fi
fi

mkdir -p "$DATA_PATH"

# Parse config
cat "$CONFIG_PATH" | jq 'del(.data_path)' | jq 'del(.zigbee_shepherd_debug)' | jq 'del(.zigbee_shepherd_devices)' > $DATA_PATH/configuration.yaml

if [[ ! -z "$ZIGBEE_HERDSMAN_DEBUG" ]]; then
    echo "[Info] Zigbee Herdsman debug logging enabled."
    DEBUG="zigbee-herdsman:*"
fi

if [[ ! -z "$ZIGBEE_SHEPHERD_DEVICES" ]]; then
    echo "[Info] Searching for custom devices file in zigbee2mqtt data path..."
    if [[ -f "$DATA_PATH"/devices.js ]]; then
        cp -f "$DATA_PATH"/devices.js ./node_modules/zigbee-herdsman-converters/devices.js
    else
        echo "[Error] File $DATA_PATH/devices.js not found! Starting with default devices.js"
    fi
fi

# RUN zigbee2mqtt
ZIGBEE2MQTT_DATA="$DATA_PATH" DEBUG="$DEBUG" pm2-runtime start npm -- start
