
#!/usr/bin/env bash

# https://github.com/kholia/OSX-KVM/blob/master/boot-passthrough.sh

# oc 启动win 会导致vnc花屏  efi直接启动没问题
# 鼠标vnc穿透 -usb -device usb-kbd -device usb-tablet
# 显卡直通的情况下，vnc和物理屏幕 屏幕显示顺序 以及鼠标穿透 和显卡地址有关

MY_OPTIONS="+ssse3,+sse4.2,+popcnt,+avx,+aes,+xsave,+xsaveopt,check"
ALLOCATED_RAM="6144" # MiB
CPU_SOCKETS="1"
CPU_CORES="6"
CPU_THREADS="12"


REPO_PATH="."
OVMF_DIR="kvm-efi-bios"

# shellcheck disable=SC2054
args=(
  -name "macos"
  -enable-kvm -m "$ALLOCATED_RAM" -cpu host,kvm=on,vendor=GenuineIntel,+invtsc,vmware-cpuid-freq=on,"$MY_OPTIONS"
  # -enable-kvm -m "$ALLOCATED_RAM" -cpu Penryn,kvm=on,vendor=GenuineIntel,+invtsc,vmware-cpuid-freq=on,"$MY_OPTIONS"
  -machine q35
  # -usb -device usb-kbd -device usb-tablet -device usb-mouse #vnc鼠标穿透 mac键盘可用，鼠标错位
  # -usb -device usb-tablet #vnc鼠标穿透 win适用
  -usb -device usb-kbd -device usb-tablet # mac 和win 都适用 键盘鼠标正常

  -smp "$CPU_THREADS",cores="$CPU_CORES",sockets="$CPU_SOCKETS"
  ## start 直通设备
  #-device usb-ehci,id=ehci,addr=0x06  #usb
  -device vfio-pci,host=0000:00:02.0,addr=0x02,multifunction=on,x-no-kvm-intx=on,x-igd-opregion=on,romfile=/mnt/ssd/vbios_gvt_uefi.rom #  ★★★★ 核显 ★★★★
  # -device vfio-pci,host=01:00.0,multifunction=on,romfile=gpu_original_bios.bin #实例代码
  #-device vfio-pci,host=0000:02:00.0,addr=0x11    # bcm的wifi卡

  #-device qemu-xhci,id=usb_passthrough,addr=0x12 # usb总线
  #-device usb-host,port=1,bus=usb_passthrough.0,vendorid=0x093a,productid=0x2510 # 鼠标
  #-device usb-host,port=2,bus=usb_passthrough.0,vendorid=0x0a5c,productid=0x4500 # 蓝牙 BCM2046B1 USB 2.0 Hub
  #-device usb-host,port=3,bus=usb_passthrough.0,vendorid=0x05ac,productid=0x821f #  Apple, Inc. Built-in Bluetooth 2.0+EDR HCI
  #-device usb-host,port=4,bus=usb_passthrough.0,vendorid=0x260d,productid=0x0013 # EK键盘
  ## end 直通设备
  -device isa-applesmc,osk="ourhardworkbythesewordsguardedpleasedontsteal(c)AppleComputerInc"
  -drive if=pflash,format=raw,readonly=on,file="$REPO_PATH/$OVMF_DIR/OVMF_CODE.fd"
  -drive if=pflash,format=raw,file="$REPO_PATH/$OVMF_DIR/OVMF_VARS-1024x768.fd"
  -smbios type=2
  -device ich9-intel-hda -device hda-duplex
  -device ich9-ahci,id=sata
  #  qemu-img create -f qcow2  mac-apfs.qcow2 50G
  -drive index=0,media=disk,format=qcow2,if=virtio,file=/mnt/ssd/kvm-win/win-sys.qcow2
  -drive index=1,media=cdrom,file=/mnt/hdd/iso/windows/SW_DVD9_Win_Pro_10_22H2_64BIT_ChnSimp_Pro_Ent_EDU_N_MLF_X23-20012.ISO
  -drive index=2,media=cdrom,file=/mnt/hdd/iso/windows/virtio-win-0.1.225.iso

  #-drive index=0,media=disk,format=raw,if=virtio,file=/mnt/ssd/osx-virio/oc.img
  #-drive index=3,media=disk,format=qcow2,if=virtio,file=/mnt/ssd/osx-virio/mac-apfs.qcow2  # apfs分区
  #-drive index=3,media=disk,format=raw,if=virtio,file=/mnt/ssd/osx-virio/macos-13.img #日志分区
  #-drive index=4,media=disk,format=raw,if=virtio,file=/mnt/ssd/osx-virio/win10-q35-efi.img # win10
  #-drive index=6,media=disk,format=raw,if=virtio,file=/mnt/hdd/iso/macos/Ventura-recovery.img  # 安装镜像
  # 需要使用smb共享，物理机需要安装samba ，win7以后的客户机需要开启smb1.0，linux和mac可以直接挂载，地址是 smb://10.0.2.4/qemu
  -netdev user,id=net0,smb=/mnt,hostfwd=tcp::13389-:3389,hostfwd=tcp::15900-:5900,hostfwd=udp::15900-:5900,hostfwd=tcp::13283-:3283,hostfwd=udp::13283-:3283,hostfwd=tcp::1222-:22
  -device virtio-net-pci,addr=0x10,netdev=net0,id=net0,mac=52:54:00:c9:18:27
  -monitor stdio
  -vga vmware
  -display none
  # -object input-linux,id=kbd1,evdev=/dev/input/by-id/usb-SEMITEK_USB-HID_Gaming_Keyboard_SN0000000001-event-kbd,grab_all=on,repeat=on
  # -object input-linux,id=mouse1,evdev=/dev/input/by-id/usb-PixArt_Dell_MS116_USB_Optical_Mouse-event-mouse
  -vnc 0.0.0.0:1 -k en-us
)

qemu-system-x86_64 "${args[@]}"
