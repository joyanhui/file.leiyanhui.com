cat > /etc/clash/rules.yaml  << EOF
##script:
##rules:
- DOMAIN-SUFFIX,gitea.io,🚀 节点选择
- DOMAIN-SUFFIX,mypikpak.com,🚀 节点选择
- DOMAIN-SUFFIX,dwz.date,🚀 节点选择
- DOMAIN-SUFFIX,chaojijichang.com,🚀 节点选择
- DOMAIN-SUFFIX,acme.sh,🚀 节点选择
- DOMAIN-SUFFIX,github.com,🚀 节点选择
- DOMAIN-SUFFIX,netlify.app,🚀 节点选择
- DOMAIN-SUFFIX,geekdocs.de,🚀 节点选择
- DOMAIN-SUFFIX,dmdy12.cc,🚀 节点选择
- DOMAIN-SUFFIX,restic.net,🚀 节点选择
- DOMAIN-SUFFIX,codigoparallevar.com,🚀 节点选择
- DOMAIN-SUFFIX,mypikpak.com,🚀 节点选择
- DOMAIN-SUFFIX,go.dev,🚀 节点选择
- DOMAIN-SUFFIX,v2ex.com,🚀 节点选择
- DOMAIN-SUFFIX,shiftr.io,DIRECT
- DOMAIN-SUFFIX,nuaa.cf,DIRECT
- DOMAIN-SUFFIX,bitwarden.com,DIRECT
## linux
- DOMAIN,dl-cdn.alpinelinux.org,🚀 节点选择
- DOMAIN,gitlab.archlinux.org,🚀 节点选择
- DOMAIN-SUFFIX,alpinelinux.org,DIRECT
- DOMAIN-SUFFIX,archlinux.org,DIRECT
- DOMAIN-SUFFIX,archlinuxcn.org,DIRECT
- DOMAIN,deb.debian.org,🚀 节点选择
- DOMAIN,cn.archive.ubuntu.com,🚀 节点选择
## github
- DOMAIN-SUFFIX,ghproxy.com,DIRECT
## netdisk
- DOMAIN-SUFFIX,r2.cloudflarestorage.com,DIRECT
- DOMAIN-SUFFIX,koofr.net,DIRECT
- DOMAIN-SUFFIX,pcloud.com,DIRECT
## 微软 补充规则
- DOMAIN-SUFFIX,www.bing.com,🚀 节点选择
#- DOMAIN-SUFFIX,cn.bing.com,DIRECT
- DOMAIN-SUFFIX,cn.bing.com,🚀 节点选择
- DOMAIN-SUFFIX,live.com,DIRECT
- DOMAIN-SUFFIX,microsoftonline.cn,DIRECT
- DOMAIN-SUFFIX,sharepoint.cn,DIRECT
## DDNS
- DOMAIN-SUFFIX,checkip.dyndns.org,DIRECT
- DOMAIN-SUFFIX,checkipv6.dyndns.org,DIRECT
- DOMAIN-SUFFIX,checkip.synology.com,DIRECT
- DOMAIN-SUFFIX,ifconfig.co,DIRECT
- DOMAIN-SUFFIX,api.myip.com,DIRECT
- DOMAIN-SUFFIX,ip-api.com,DIRECT
- DOMAIN-SUFFIX,ipapi.co,DIRECT
- DOMAIN-SUFFIX,ip6.seeip.org,DIRECT
- DOMAIN-SUFFIX,members.3322.org,DIRECT
## eu.org
- DOMAIN-SUFFIX,nic.eu.org,🚀 节点选择
- DOMAIN-SUFFIX,eu.org,DIRECT
## leiyanhui
- DOMAIN-SUFFIX,dev.leiyanhui.com,🚀 节点选择
- DOMAIN-SUFFIX,doc.shiyuxin.ltd,🚀 节点选择
- DOMAIN,leiyanhui.com,DIRECT
## 
- GEOIP,CN,DIRECT
EOF
clash -s stop && clash -s start
