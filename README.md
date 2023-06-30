---
title: '个人导航'
---
# file.leiyanhui.com
file.leiyanhui.com

国内通道关闭，直接强制走境外github

基于dnspod 分流和 cdn加速
## 私密仓库
https://github.com/joyanhui/private_file/
## ssl
https://github.com/joyanhui/ssl
## 公开文件

### 常用的一个公钥  私钥不在这
```
mkdir ~/.ssh
cat ~/.ssh/authorized_keys
wget https://file.leiyanhui.com/linux.pub   -O ~/.ssh/authorized_keys
chmod 600 ~/.ssh/authorized_keys
cat ~/.ssh/authorized_keys
```
## 分支

### windows 字体

https://github.com/joyanhui/file.leiyanhui.com/tree/windows_font

            su
            mkdir /usr/share/fonts/WindowsFonts
            
            git clone -b windows_font https://github.com/joyanhui/file.leiyanhui.com.git
            # wget -c https://github.com/joyanhui/file.leiyanhui.com/archive/refs/heads/windows_font.zip
            # wget -c https://ghproxy.com/https://github.com/joyanhui/file.leiyanhui.com/archive/refs/heads/windows_font.zip
            unzip windows_font.zip
            mv file.leiyanhui.com-windows_font/* .
            rm -rf file.leiyanhui.com-windows_font/
            fc-cache -f
#### 单独雅黑 
 msyh.ttc标 msyhbd.ttc粗 msyhl.ttc细

```
su
mkdir /usr/share/fonts/WindowsFonts && cd /usr/share/fonts/WindowsFonts
wget https://raw.githubusercontent.com/joyanhui/file.leiyanhui.com/windows_font/msyh.ttc
wget https://raw.githubusercontent.com/joyanhui/file.leiyanhui.com/windows_font/msyhbd.ttc
wget https://raw.githubusercontent.com/joyanhui/file.leiyanhui.com/windows_font/msyhl.ttc
pacman -Rcns wqy-zenhei
fc-cache -f
```
            

### 一组壁纸

https://pan.jia.leiyanhui.com:50443/wl/?id=QaB5FeLn1hw20CAhDEgRXl09KLoriioh

[https://github.com/joyanhui/file.leiyanhui.com/tree/dwm-wallpaper](https://github.com/joyanhui/file.leiyanhui.com/tree/dwm-wallpaper)

            #wget -c https://github.com/joyanhui/file.leiyanhui.com/archive/refs/heads/dwm-wallpaper.zip
            wget https://ghproxy.com/https://raw.githubusercontent.com/joyanhui/file.leiyanhui.com/dwm-wallpaper/zifa.jpg
### 其他

#### 常用镜像下载
```
ed2k://|file|zh-cn_windows_server_2022_updated_oct_2022_x64_dvd_884ce1ea.iso|5406582784|E3E50341C9D3F8389F7ACACEA0D26843|/
ed2k://|file|zh-cn_windows_11_consumer_editions_version_22h2_updated_nov_2022_x64_dvd_2c7e96c3.iso|5673539584|EB8FF2B481BB6AFE71B2784C6485733B|/
ed2k://|file|zh-cn_windows_10_consumer_editions_version_22h2_updated_nov_2022_x64_dvd_8bb31339.iso|6085199872|8A30D55EC70B96F629491E830FE30B34|/
magnet:?xt=urn:btih:BD57136F51ACD60E5412085E4066EA4496C6601E&dn=FydeOS_PC_v10.0-stable.img.xz&xl=1789463424
```


[https://github.com/joyanhui/file.leiyanhui.com](https://github.com/joyanhui/file.leiyanhui.com)
