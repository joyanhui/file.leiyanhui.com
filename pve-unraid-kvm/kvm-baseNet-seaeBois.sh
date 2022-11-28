qemu-system-x86_64 -enable-kvm -machine pc-q35-7.1  -m 8192   \
-name  w10 \
-cpu host,hv_relaxed,hv_spinlocks=0x1fff,hv_vapic,hv_time \
-smp 12,sockets=1,cores=6 \
-netdev user,id=mynet0,hostfwd=tcp::13389-:3389,hostfwd=tcp::23389-:3389 -device e1000,netdev=mynet0 \
-boot menu=on,splash-time=15000 \
-usb -device usb-tablet \
-vga vmware \
-drive index=1,media=disk,format=raw,if=virtio,file=/mnt/exfat/win10.img,cache=unsafe \
-drive index=2,media=cdrom,file=/mnt/hdd/iso/windows/Win10-21H2.iso \
-drive index=3,media=cdrom,file=/mnt/hdd/iso/virtio-win-0.1.225.iso \
-drive index=4,media=cdrom,file=/mnt/hdd/iso/pe/FirPE-V1.8.1.iso \
-vnc :1

