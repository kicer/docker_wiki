# WiFi Kit 8

### 来源

[WIFI KIT 8（ESP8266）](http://www.heltec.cn/project/wifi_kit_8/)

[ESP8266 OLED 可刷NodeMCU](https://item.taobao.com/item.htm?id=555696953988)

### 详细

[电路原理图](https://github.com/Heltec-Aaron-Lee/WiFi_Kit_series/raw/master/SchematicDiagram/WIFI_Kit_8_Schematic_diagram.PDF)

![wk8-detail](/images/find/diy/8d89813601428263.jpg)

```
WiFi: esp8266
串口: cp2104
OLED: 0.96寸, 128x32 (SSD1306 I2C)
尺寸: 51x18x8 
供电: micro-usb+锂电池充放电电路
```

### 开发

官方提供HelTec WiFi Kit开发环境，基于arduino: 
https://github.com/Heltec-Aaron-Lee/WiFi_Kit_series

arduino OLED库:
https://github.com/Heltec-Aaron-Lee/heltec0.96OLED

### 调试

arduino测试失败:(

```
1. arduino版本(v1.8.8)太新，某些配置项不匹配
2. build.flash_flags (fix by boards.txt)
3. -llwip2-536-feat (not fix!)
```

NodeMCU模式



---------

[^锂电池] [中顺锂电池](http://www.chinabatteryweb.com/)
