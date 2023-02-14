
qemu-system-x86_64 -enable-kvm -machine pc-q35-7.1  -m 4G \
-boot menu=on \
-usb -device usb-kbd -device usb-tablet \
-netdev user,id=net0,smb=/mnt,hostfwd=tcp::13389-:3389,hostfwd=tcp::15900-:5900,hostfwd=udp::15900-:5900,hostfwd=tcp::13283-:3283,hostfwd=udp::13283-:3283,hostfwd=tcp::1222-:22 \
-device virtio-net-pci,netdev=net0,id=net0,mac=52:54:00:c9:18:27 \
-device usb-ehci,id=ehci \
-device qemu-xhci,id=qxhci -device usb-host,port=1,bus=qxhci.0,hostdevice=/dev/bus/usb/001/002 \
-device usb-host,port=2,bus=qxhci.0,vendorid=0x0a5c,productid=0x4500 \
-device usb-host,port=3,bus=qxhci.0,vendorid=0x05ac,productid=0x821f \
-device nec-usb-xhci,id=xhci \
-global nec-usb-xhci.msi=off \
-device isa-applesmc,osk="ourhardworkbythesewordsguardedpleasedontsteal(c)AppleComputerInc" \
-smbios type=2  \
-device ich9-intel-hda -device hda-duplex \
-device ich9-ahci,id=sata \
-smp 8,sockets=1,cores=4 \
-cpu host,kvm=on,vendor=GenuineIntel,+kvm_pv_unhalt,+kvm_pv_eoi,+hypervisor,+invtsc \
-bios /usr/share/edk2-ovmf/x64/OVMF.fd \
-drive index=1,media=disk,format=raw,if=virtio,file=/mnt/ssd//win10-q35-efi.img \
-vga vmware \
-device virtio-serial-pci -spice port=5902,disable-ticketing -device virtserialport,chardev=spicechannel0,name=com.redhat.spice.0 -chardev spicevmc,id=spicechannel0,name=vdagent \
-vnc  :1