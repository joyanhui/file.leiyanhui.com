# 可用： wifi直通 usb设备直通 蓝牙 wifi 核显
# 硬件加速可用
# 不可用的：声卡没有直通，但是rdp和spcie声卡可用
# vnc屏幕为主屏 支持多分辨率，核显屏幕为扩展，vnc鼠标可以用，usb鼠标可用
# 除了声卡之外，趋近完美
# 主副卡显示屏 可以通过开关vnc 或者修改 关于和核显的那行配置来修改，也可以在win里面设置
qemu-system-x86_64 -enable-kvm -machine pc-q35-7.1  -m 4G \
-boot menu=on \
-device vfio-pci,host=0000:00:02.0,addr=0x02,x-igd-opregion=on,x-igd-gms=1,romfile=/mnt/ssd/vbios_gvt_uefi.rom \
-device vfio-pci,host=02:00.0 \
-usb -device usb-kbd -device usb-tablet \
-netdev user,id=net0,smb=/mnt,hostfwd=tcp::13389-:3389,hostfwd=tcp::15900-:5900,hostfwd=udp::15900-:5900,hostfwd=tcp::13283-:3283,hostfwd=udp::13283-:3283,hostfwd=tcp::1222-:22 \
-device virtio-net-pci,addr=0x10,netdev=net0,id=net0,mac=52:54:00:c9:18:27 \
-device usb-ehci,id=ehci \
-device nec-usb-xhci,id=xhci \
-global nec-usb-xhci.msi=off \
-device isa-applesmc,osk="ourhardworkbythesewordsguardedpleasedontsteal(c)AppleComputerInc" \
-smbios type=2  \
-device ich9-intel-hda -device hda-duplex \
-device ich9-ahci,id=sata \
-smp 8,sockets=1,cores=4 \
-cpu Penryn,kvm=off,vendor=GenuineIntel,+kvm_pv_unhalt,+kvm_pv_eoi,+hypervisor,+invtsc \
-bios /usr/share/edk2-ovmf/x64/OVMF.fd \
-drive index=1,media=disk,format=raw,if=virtio,file=/mnt/ssd/win10-q35-efi.img \
-device qemu-xhci,id=qxhci \
-device usb-host,port=1,bus=qxhci.0,vendorid=0x093a,productid=0x2510 \
-device usb-host,port=2,bus=qxhci.0,vendorid=0x0a5c,productid=0x4500 \
-device usb-host,port=3,bus=qxhci.0,vendorid=0x05ac,productid=0x821f \
-vga virtio \
-device virtio-serial-pci -spice port=5902,disable-ticketing=on  -device virtserialport,chardev=spicechannel0,name=com.redhat.spice.0 -chardev spicevmc,id=spicechannel0,name=vdagent \
-vnc :1
