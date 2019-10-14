# Home Assistant


### 缘由
小米蓝牙温湿度计，好看又实用，数值也比较准确，希望可以集成到检测仪中使用。


### gatttool

需要实现的主要工作：
1. 破解温湿度计蓝牙协议
2. 集成蓝牙模块

后发现有github上已实现数据解析[mitemp_bt](https://github.com/flavio20002/mitemp_bt)，
其核心实现即是向MJ_HT_V1设备的0x10 handle中写入0100并监听notify。
```shell
# hcitool -i hci0 lescan
LE Scan ...
58:2D:34:35:7D:FC (unknown)
58:2D:34:35:7D:FC MJ_HT_V1
# /usr/local/bin/gatttool --device=58:2D:34:35:7D:FC --char-write-req -a 0x10 -n 0100 --adapter=hci0 --listen
```

`mitemp_bt`为home-assistant的插件，暮然发现这块包括homekit都是完全新的一个领域～
