# kvm 运行alpine 跑一些容器用

MY_OPTIONS="+ssse3,+sse4.2,+popcnt,+avx,+aes,+xsave,+xsaveopt,check"
ALLOCATED_RAM="1G" # MiB
CPU_SOCKETS="1"
CPU_CORES="6"
CPU_THREADS="12"
args=(
  -name "arch"
  -enable-kvm -m "$ALLOCATED_RAM" -cpu host,kvm=on,vendor=GenuineIntel,+invtsc,vmware-cpuid-freq=on,"$MY_OPTIONS"
  -machine q35
  -usb -device usb-kbd -device usb-tablet # 鼠标穿透 mac 和win linux 都适用 键盘鼠标正常
  -smp "$CPU_THREADS",cores="$CPU_CORES",sockets="$CPU_SOCKETS"
  -smbios type=2
  -device ich9-intel-hda -device hda-duplex
  -device ich9-ahci,id=sata
  #qemu-img create -f qcow2  alpine-sys.qcow2 50G
  #-cdrom /mnt/hdd/iso/linux/alpine-virt-3.16.3-x86_64.iso
  -drive index=0,media=disk,format=qcow2,if=virtio,file=/mnt/ssd/alpinx-kvm/alpine-sys.qcow2
  -netdev user,id=net0,smb=/mnt,hostfwd=tcp::3306-:3306,hostfwd=tcp::8080-:8080,hostfwd=tcp::8081-:80,hostfwd=tcp::8443-:443,hostfwd=tcp::2228-:22,hostfwd=tcp::2017-:2017,hostfwd=tcp::20170-:20170,hostfwd=tcp::20171-:20171,hostfwd=tcp::20172-:20172,hostfwd=tcp::20173-:20173
  -device virtio-net-pci,addr=0x10,netdev=net0,id=net0,mac=52:54:00:c9:18:08
  -monitor stdio
  -vga virtio
  -display none
  -vnc 0.0.0.0:8 -k en-us
)

qemu-system-x86_64 "${args[@]}"
