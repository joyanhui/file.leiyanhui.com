# file.leiyanhui.com
file.leiyanhui.com

个人项目的静态文件，国内走腾讯cdn，境外直接github pages


基于dnspod 分流和 cdn加速


## 公开文件

### 常用的一个公钥  私钥不在这

https://file.leiyanhui.com/linux.pub 

## 分支

### windows 字体

https://github.com/joyanhui/file.leiyanhui.com/tree/windows_font

            su
            mkdir /usr/share/fonts/WindowsFonts
            cd /usr/share/fonts/WindowsFonts
            git clone -b windows_font https://github.com/joyanhui/file.leiyanhui.com.git
            # wget -c https://github.com/joyanhui/file.leiyanhui.com/archive/refs/heads/windows_font.zip
            # wget -c https://ghproxy.com/https://github.com/joyanhui/file.leiyanhui.com/archive/refs/heads/windows_font.zip
            unzip windows_font.zip
            mv file.leiyanhui.com-windows_font/* .
            rm -rf file.leiyanhui.com-windows_font/
            fc-cache -f

            

### 一组壁纸

[https://github.com/joyanhui/file.leiyanhui.com/tree/dwm-wallpaper](https://github.com/joyanhui/file.leiyanhui.com/tree/dwm-wallpaper)

            #wget -c https://github.com/joyanhui/file.leiyanhui.com/archive/refs/heads/dwm-wallpaper.zip
            wget https://ghproxy.com/https://raw.githubusercontent.com/joyanhui/file.leiyanhui.com/dwm-wallpaper/zifa.jpg
### 其他

[https://github.com/joyanhui/file.leiyanhui.com](https://github.com/joyanhui/file.leiyanhui.com)
