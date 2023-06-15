# 内置了一个test模块
内容如下
```
cd ~/mpy-bin/micropython/ports/esp32/modules
nano test.py
-----------------
import time

def hello():
    print("hello world")
def hw(str):
    print(str)
def cycle(str):
    while True:
        print(str)
        time.sleep(1)
```
