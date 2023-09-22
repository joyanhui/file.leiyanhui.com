# 自动为clash创建cloudflare warp节点
利用clash-tun支持wireguard 以及 cloudflare warp实际是基于wireguard的特点。 
自动为 clash/openclash 创建warp/warp+ 配置文件，可以使用 clash/openclash 的分流规则。
## 基本说明
简单修改一下，也可以附加到现有订阅文件上面。
默认选择15个速度最快的节点。  
## 使用方法 
下面主要是基于openwrt amd64,其他环境也一样。
需要bash 和 wget nano/vi 没有别的依赖
```
opkg install wget bash #openwrt
apt install wget bash #debian ubuntu
```
###  获取public-key 和 private-key
使用 [wgcf](https://github.com/ViRb3/wgcf/) 获取public-key 和 private-key 

```bash
wget  https://github.com/ViRb3/wgcf/releases/download/v2.2.19/wgcf_2.2.19_linux_amd64 
mv wgcf_2.2.19_linux_amd64 cf && chmod +x cf
./cf register #注册
./cf generate #生成配置文件
nano wgcf-account.toml #license_key 修改成你的warp+的收费/推广license_key
#更新重新生成
./cf update
./cf generate
./cf status
cat wgcf-profile.conf
```
查看wgcf-profile.conf 文件里面的 PublicKey 和  PrivateKey 
### 下载脚本
```
mkdir -p /opt/clash-warp-yxip && cd  /opt/clash-warp-yxip #任意目录均可
wget -N https://ghproxy.com/https://raw.githubusercontent.com/joyanhui/file.leiyanhui.com/main/warp-yxip-clash/clash-warp-yxip.sh
```

### 执行
开始优选ip，拿到速度最快的15个节点并生产clash配置文件
```
bash clash-warp-yxip.sh v4 {public-key}  {private-key}
```

### openwrt定时更新
clash需要用tun内核
```
计划任务添加
 cd  /opt/clash-warp-yxip && bash clash-warp-yxip.sh v4 {public-key}  {private-key}  && rm -f /etc/openclash/config/clash-warp.yaml &&  cp clash-warp.yaml /etc/openclash/config/clash-warp.yaml && service openclash restart
```
例如
```
0 7 * * * cd /opt/clash-warp-yxip && bash clash-warp-yxip.sh v4 XXXXXXXX= XXXXXXXXX= && rm -f /etc/openclash/config/clash-warp.yaml && cp clash-warp.yaml /etc/openclash/config/clash-warp.yaml && service openclash restart

```

### 源自
本脚本源自： [warp-yxip](https://gitlab.com/Misaka-blog/warp-script/)

