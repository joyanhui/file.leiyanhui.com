
# 版本
基于micropython-1.20.0  和  esp-idf-v4.4.5
# 硬件
esp32-GENERIC   # 我没有芯片，网友 测试通过
# 烧录命令
```
esptool --port COM3  erase_flash
esptool --port COM3 --baud 1000000 write_flash -z 0x1000 esp32-s2-mini-psram-smartconfig.bin
```
# 模块
```
>>> help('modules')
__main__          ds18x20           mip/__init__      time
_boot             errno             neopixel          uasyncio/__init__
_espnow           esp               network           uasyncio/core
_onewire          esp32             ntptime           uasyncio/event
_thread           espnow            onewire           uasyncio/funcs
_uasyncio         flashbdev         os                uasyncio/lock
_webrepl          framebuf          platform          uasyncio/stream
apa106            gc                random            uctypes
array             hashlib           re                umqtt/robust
binascii          heapq             s2mini            umqtt/simple
btree             inisetup          select            upysh
builtins          io                smartconfig       urequests
cmath             json              socket            webrepl
collections       machine           ssl               webrepl_setup
cryptolib         math              struct            websocket
dht               micropython       sys 
```
