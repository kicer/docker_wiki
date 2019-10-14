### 安装
调试BLE蓝牙蛋疼的gatttool只有linux系统上有，倒腾半天终于想起了娃娃机板卡NEO PLUS2。
后面发现手机不root的话有[Termux](https://github.com/termux/termux-app)可以用来跑Linux。


### NEO PLUS2
板卡自带的python3环境版本低，需要>3.5.3方可安装home-assistant。
娃娃机应用时候有带python3.6环境，根据教程新建homeassistant账户操作以避免污染环境。

```shell
# useradd -rm homeassistant
# mkdir /srv/homeassistant
# chown homeassistant:homeassistant homeassistant
# su -s /bin/bash homeassistant
$ cd /srv/homeassistant
$ python3.6 -m venv .
$ source bin/activate
# apt-get install build-essential libssl-dev libffi-dev python-dev
$ pip3 install homeassistant
$ hass
```

特别注意新建的账户及虚拟环境，使用`source bin/activate`才能正常使用。
浏览器中访问`192.168.99.211:8123`即可，出现报错提示websocket错误。

```log
WebSocket connection to 'ws://192.168.99.211:8123/api/websocket' failed: Connection closed before receiving a handshake response
```
最后发现居然是shadowsocket的原因～


### Android Phone
新版(2018+)手机基本不再支持root，开始又被绕到root手机的坑里面了。
后面NEO PLUS2搞定完了后，刷网页又发现了Termux，开始新一轮折腾之路。

``` shell
### F-Droid上直接下载[apk](https://f-droid.org/packages/com.termux/)
### 安装完成后，首先搞定ssh方便电脑操作
$ pkg update
$ pkg install openssh

### 复制电脑的rsa_pub.key内容到.ssh/authorized_keys中
### 查看用户、ip信息，并启动ssh服务后登陆
$ whoami; ifconfig
$ sshd
$ ssh u0_a218@192.168.99.173 -p 8022

### 安装需要的软件包，当前python为3.7.x
pkg install python vim clang build-essential
pip install --upgrade pip

### 安装homeassistant
pip install homeassistant
```
