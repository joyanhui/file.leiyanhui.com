@echo off
color 2F
::11-13代生成OPROM
::"%~dp0tools/EfiRom.exe" -f 0xffff -i 0xffff -ec tools/IntelGopDriver13500h.efi tools/igd.efi -o igd13th_dds666.rom


::11-13代生成OPROM
::"%~dp0tools/EfiRom.exe" -f 0xffff -i 0xffff -ec tools/IntelGopDriver8505.efi tools/igd.efi tools/IgdAssignmentDxe.efi -o igd8505_dds666.rom



::6-10代生成OPROM
::"%~dp0tools/EfiRom.exe" -f 0xffff -i 0xffff -ec tools/IntelGopDriver10600.efi tools/IgdAssignmentDxe.efi tools/PlatformGOPPolicy.efi -o igd10th_dds666.rom


"%~dp0tools/EfiRom.exe" -f 0xffff -i 0xffff -ec tools/IntelGopDriver_form_UBU_9900t.efi tools/IgdAssignmentDxe.efi tools/PlatformGOPPolicy.efi -o i9900t.rom

::6-13代生成OPROM
::"%~dp0tools/EfiRom.exe" -f 0xffff -i 0xffff -ec tools/IntelGopDriver10600.efi tools/IgdAssignmentDxe.efi tools/igd.efi -o igd_allth_dds666.rom



::"%~dp0tools/EfiRom.exe" -f 0xffff -i 0xffff -ec tools/IntelGopDriver10600.efi tools/IgdAssignmentDxe.efi tools/PlatformGOPPolicy.efi -o igd10th_dds666.rom


::pause