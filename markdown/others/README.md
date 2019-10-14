## 杂记

### mac ssh代理设置
> 1. 启用ssh代理
> ssh -fND 127.0.0.1:12345 root@server
> 2. 系统偏好设置>高级>代理>SOCKS代理>127.0.0.1:12345

### kill掉特定进程
> kill $(ps aux | grep '[p]ython3.6' | awk '{print $2}')
