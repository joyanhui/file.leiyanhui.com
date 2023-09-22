
源自： [warp-yxip](https://gitlab.com/Misaka-blog/warp-script/)

使用方法 
### linux 或openwrt
```
opkg install wget bash #openwrt
apt install wget bash #debian ubuntu
```
### 下载脚本
```
mkdir -p /opt/clash-warp-yxip && cd  /opt/clash-warp-yxip #任意目录均可
wget -N https://ghproxy.com/https://raw.githubusercontent.com/joyanhui/file.leiyanhui.com/main/warp-yxip-clash/clash-warp-yxip.sh
```
###  获取public-key 和 private-key
使用 [wgcf](https://github.com/ViRb3/wgcf/) 获取public-key 和 private-key 然后执行
```
bash clash-warp-yxip.sh v4 {public-key}  {private-key}
```

### openwrt定时更新
clash需要用tun内核
```
计划任务添加
 cd  /opt/clash-warp-yxip && bash clash-warp-yxip.sh v4 {public-key}  {private-key}  && rm -f /etc/openclash/config/clash-warp.yaml &&  cp clash-warp.yaml /etc/openclash/config/clash-warp.yaml && service openclash restart
```
