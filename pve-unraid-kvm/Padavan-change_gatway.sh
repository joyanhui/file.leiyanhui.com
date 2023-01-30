#!/bin/bash

default_gateway='10.1.1.1'  #主路由 IP
up_gateway='10.1.1.50'   #旁路由 IP （需设置的主路由 DNS 地址）

check_ip_available(){  #使用 ping 命令检测旁路由是否在线
    ping -c 3 $1 | grep packets | awk '{print $4}'
}

change_gateway_dns(){  #网关 DNS 切换
   nvram set dhcp_gateway_x=$1  #设置网关
   nvram set dhcp_dns1_x=$1
   nvram set dhcp_dns2_x=""  #设置 DNS
   nvram commit  #提交修改
   sleep 2
   rc rc_service restart_net_and_phy  #重启主路由 网络服务
   restart_dns    #重启主路由 DNS
   restart_dhcpd  #重启主路由 DHCP
   # sleep 5
   # reboot  #自动修改后存在网络故障，可能需要直接重启路由器， 等待时间较长
}

# If the gateway of the up close, the network is completely unusable

res=`check_ip_available $up_gateway`  #检测旁路由是否存在
current_gateway=`nvram get dhcp_gateway_x`  #获取主路由当前网关

if [ $(($res)) -eq 0 ]; #检测结果等于 0，即旁路由不存在，应设置网关和 DNS 为主路由地址
then
    if [ "$current_gateway" != "$default_gateway" ]; then  #如果当前网关地址不是主路由地址
        echo "up_gateway to default"
        `change_gateway_dns $default_gateway`  #将网关和DNS切换为主路由地址 并重启
    fi
    echo "use default gateway , nothing changed" # 什么都不用做
    exit 1
fi
if [ $(($res)) -ne 0 ]; #检测结果不等于 0，即旁路由存在，应设置网关和 DNS 为旁路由地址
then
    if [ "$current_gateway" != "$up_gateway" ]; then #如果当前网关地址不是主路由地址
        echo "up_gateway to  auxiliary_gateway" 
        `change_gateway_dns $up_gateway` #将网关和DNS切换为旁路由地址 并重启
    fi
    echo "use auxiliary_gateway , nothing changed" # 什么都不用做
    exit 1
fi

#将脚本置于 /etc/storage/change_gatway.sh 
#设置脚本运行权限：`chmod +x  /etc/storage/change_gatway.sh `  
#保存脚本，防止重启丢失：`/sbin/mtd_storage.sh save`
#自动定时运行脚本（每一分钟检测一次）：
#`系统管理 - 服务 ` 调度任务 (Crontab)  加入 `*/1 * * * * /etc/storage/change_gatway.sh` 
