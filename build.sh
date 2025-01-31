#!/bin/bash
ARDUINO_CLI_PATH=/workspace/bin
export PATH="$ARDUINO_CLI_PATH:$PATH"
$ARDUINO_CLI_PATH/arduino-cli compile --fqbn  esp32:esp32:esp32 ./yoRadio/yoRadio.ino  --board-options PartitionScheme=min_spiffs -v