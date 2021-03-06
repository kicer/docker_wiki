# 格子机

### 拆解

```
* 三线插头供电，设备外部有3m长gprs天线
* 外部彩色LED灯条，亚克力导光条
* 每格子内上部有一小LED展示灯
* 机器面板设计合理，不易徒手撬开
```
![上电](/images/work/gzj/b100679b0d4c37ca.jpg)

```
每格子对应一个二维码（无背胶），用于扫码对应商品。
另有一设备绑定用二维码，用于管理后台绑定（易售云，类乐摇摇后台）。
设备暂无法绑定，提示需先解绑后再使用
```
![二维码](/images/work/gzj/dacc8a181d95b862.jpg)

```
拆除背板后知包括这些部件：电源适配器、2G主控板、6小LED灯板、6门锁及配套线缆。
安装稍显繁琐，螺丝拆装操作不便
```
![拆除背板](/images/work/gzj/afb7a3a00f344638.jpg)

```
12V 5A电源，分别给主控板、LED灯板、LED灯条供电。
所有电源均直接供给，未有对应开关控制。
开关电源接线处有塑料保护盖。
```
![电源](/images/work/gzj/d006db2cc070d5fc.jpg)

```
门锁质量不错，设计利用类继电器方式控制。
手动推门后锁定，通电后自动弹开。
动作电压12V，吸合电流1.7A，具体动作时间需要测试。
```
![门锁1](/images/work/gzj/cadcf3cd46827a95.jpg)
![门锁2](/images/work/gzj/426044147a25ab13.jpg)

```
6xLED灯板限流电阻620欧姆，支持3p电源线正反插。
502胶水？黏贴到壳体上，容易掉落。
```
![LED灯板](/images/work/gzj/e988de97274e4e19.jpg)

```
主控板使用2G Air202E模块，内部集成SIM卡。
XL2596-ADJ提供~4V模块工作电压，3层PCB板。
74HC595D驱动可选通2x4路门锁。
3400+NCE60P04Y场效应管驱动门锁12V通断控制。
```
![主控板](/images/work/gzj/d18afaaa2ac3b95e.jpg)

### 分析
产品基本成熟，配套硬件各组件支持完善，电路/布线等合理规范。

### 制造与改进
* 采用4G模组，或2G+WiFi方案，避免信号盲区问题
* 可直接用成品dtu+继电器电路板快速搭建
* 格子内LED灯板固定方式需改进
* 外部LED灯装饰条考虑做优化？安装不便成本高
* 用OneNet等公有云做设备管理
* 格子二维码优化，只采用1个即可
