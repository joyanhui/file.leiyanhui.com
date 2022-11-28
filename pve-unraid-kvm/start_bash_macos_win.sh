
qemu-system-x86_64 -enable-kvm -machine pc-q35-7.1  -m 4G \
-boot menu=on \
-usb -device usb-kbd -device usb-tablet \
-netdev user,id=net0,hostfwd=tcp::13389-:3389,hostfwd=tcp::15900-:5900,hostfwd=udp::15900-:5900,hostfwd=tcp::13283-:3283,hostfwd=udp::13283-:3283,hostfwd=tcp::1222-:22 \
-device virtio-net-pci,netdev=net0,id=net0,mac=52:54:00:c9:18:27 \
-device usb-ehci,id=ehci \
-device nec-usb-xhci,id=xhci \
-global nec-usb-xhci.msi=off \
-device isa-applesmc,osk="ourhardworkbythesewordsguardedpleasedontsteal(c)AppleComputerInc" \
-smbios type=2  \
-device ich9-intel-hda -device hda-duplex \
-device ich9-ahci,id=sata \
-smp 8,sockets=1,cores=4 \
-cpu host,kvm=on,vendor=GenuineIntel,+kvm_pv_unhalt,+kvm_pv_eoi,+hypervisor,+invtsc \
-bios /usr/share/edk2-ovmf/x64/OVMF.fd \
-drive id=OpenCoreBoot,if=none,snapshot=on,format=raw,file="/mnt/ext4/OpenCore-V19.img" \
-device ide-hd,bus=sata.2,drive=OpenCoreBoot \
#-drive index=0,media=disk,format=qcow2,if=virtio,file=/mnt/ext4/xiaobing.qcow2 \
-drive index=1,media=disk,format=raw,if=virtio,file=/mnt/ext4/macos-13.img \
-drive index=2,media=disk,format=raw,if=virtio,file=/mnt/ext4/win10-q35-efi.img \
-drive index=3,media=disk,format=qcow2,if=virtio,file=/mnt/ext4/temp.qcow2 \
-vga vmware \
-vnc  :1
