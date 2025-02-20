#line 1 "/workspace/yoradio/yoRadio/src/async-mqtt-client/AsyncMqttClient/MessageProperties.hpp"
#pragma once

struct AsyncMqttClientMessageProperties {
  uint8_t qos;
  bool dup;
  bool retain;
};
