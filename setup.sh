#!/bin/bash
# Make sure only root can run our script
#if [[ $EUID -ne 0 ]]; then
#   echo -e "\e[31m This script must be run as root" 1>&2
#   echo -e "\e[31m Write to command line: sudo su and then run this script again" 1>&2
#   exit 1
#fi
ARDUINO_CLI_PATH=/workspace/bin
echo -e "\e[1;34mUpdating path.\e[0m"
export PATH="$( echo $PATH| tr : '\n' |grep -v /workspace/bin/ | paste -s -d: )"
sudo export PATH="$ARDUINO_CLI_PATH:$PATH"
export PATH="$ARDUINO_CLI_PATH:$PATH"
cd /workspace
read -p "Would you like to Add repository Universe and run apt update? <y/N> " prompt
if [[ $prompt == "y" || $prompt == "Y" || $prompt == "yes" || $prompt == "Yes" ]]
then
    
    sudo add-apt-repository universe
    sudo apt-get update
    echo -e "\e[1;34mDone.\e[0m"
fi

read -p "Would you like to install Midnight Commander? <y/N> " prompt
if [[ $prompt == "y" || $prompt == "Y" || $prompt == "yes" || $prompt == "Yes" ]]
then
    sudo apt-get install mc -y
    echo -e "\e[1;34mDone.\e[0m"
fi

read -p "Would you like to install Arduino CLI environment? <y/N> " prompt
if [[ $prompt == "y" || $prompt == "Y" || $prompt == "yes" || $prompt == "Yes" ]]
then
    rm ./install.sh
    wget https://raw.githubusercontent.com/arduino/arduino-cli/master/install.sh
    chmod 755 ./install.sh
    sh ./install.sh
    $ARDUINO_CLI_PATH/arduino-cli core update-index
    $ARDUINO_CLI_PATH/arduino-cli core update-index --additional-urls https://arduino.esp8266.com/stable/package_esp8266com_index.json
    $ARDUINO_CLI_PATH/arduino-cli core install esp32:esp32
    $ARDUINO_CLI_PATH/arduino-cli core install arduino:esp32
    echo -e "\e[1;34mDone.\e[0m"
fi

read -p "Would you like to install Additional libraries to build yoradio? <y/N> " prompt
if [[ $prompt == "y" || $prompt == "Y" || $prompt == "yes" || $prompt == "Yes" ]]
then
    $ARDUINO_CLI_PATH/arduino-cli lib install "Adafruit GFX Library"
    $ARDUINO_CLI_PATH/arduino-cli lib install "Adafruit ST7735 and ST7789 Library"
    $ARDUINO_CLI_PATH/arduino-cli lib install "Adafruit SSD1306"
    $ARDUINO_CLI_PATH/arduino-cli lib install "Adafruit PCD8544 Nokia 5110 LCD library"
    $ARDUINO_CLI_PATH/arduino-cli lib install "Adafruit SH110X"
    $ARDUINO_CLI_PATH/arduino-cli lib install "Adafruit ILI9341"
    $ARDUINO_CLI_PATH/arduino-cli lib install "Adafruit SSD1305"
    $ARDUINO_CLI_PATH/arduino-cli lib install  "TFT_22_ILI9225"
    $ARDUINO_CLI_PATH/arduino-cli lib install "OneButton"
    $ARDUINO_CLI_PATH/arduino-cli lib install "IRremoteESP8266"
    $ARDUINO_CLI_PATH/arduino-cli lib install "XPT2046_Touchscreen"
    $ARDUINO_CLI_PATH/arduino-cli lib install "RTCLib" 
    echo -e "\e[1;34mDone.\e[0m"
fi
echo -e "\e[1;34mDone all steps.\e[0m"

