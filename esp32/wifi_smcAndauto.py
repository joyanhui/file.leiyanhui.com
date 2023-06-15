'''
默认优先链接到 wifi.json 如果超时，那么链接默认出厂wifi，如果依旧超时，进入smartconfig模式。
如果有按键相应，那么切换到AP模式 或者 smartconfig模式（文末）

'''
import network
import socket
import smartconfig
import time
import json
import sys


# wifi 链接超时时间
wifi_wait_time=6 # 单位秒
smartconfig_wait_time=120 # 单位 0.5秒  120即1分钟秒

wlan = None  #wlan

# 链接默认wifi
def connectDefaultWifi():
    connectWifi('syx',"12345678")
# 链接指定的wifi
def connectWifi(ssid,passwd):   
    global wlan
    global wifi_wait_time
    wlan = network.WLAN(network.STA_IF) 
    wlan.active(True)   #激活网络
    wlan.disconnect()   #断开WiFi连接
    print("wifi connecting : "+ssid,end=' ')
    wlan.connect(ssid, passwd)   #连接WiFi
    wait_time = 0
    while(wlan.ifconfig()[0] == '0.0.0.0'):   #等待连接
        print(".",end='')
        time.sleep(1)
        wait_time=wait_time+1
        if wait_time > wifi_wait_time:
            break
    print(" end")
    print(wlan.ifconfig()[0])
    #return True
def connectUserWifi():
    try:
        file = open("wifi.json", "r")
        line = file.read()
        file.close()
        print (line)
        jsonWifi=json.loads(line)
        connectWifi(jsonWifi['ssid'],jsonWifi['passwd'])
    except: #if not exist
        print ("wifi.json file not exist")


# ip转换为bytes
def inet_pton(ip_str:str):
    '''convert ip address from string to bytes'''
    ip_bytes = b''
    ip_segs = ip_str.split('.')
    for seg in ip_segs:
        ip_bytes += int(seg).to_bytes(1, 'little')
    return ip_bytes
# 发送ack_done 信息给手机
def SmartconfigSend_ack(local_ip, local_mac):
    '''sent ack_done event to phone'''
    udp = socket.socket(socket.AF_INET, socket.SOCK_DGRAM)
    udp.setsockopt(socket.SOL_SOCKET, socket.SO_REUSEADDR, 1)

    data = smartconfig.info()[3].to_bytes(1, 'little') + local_mac
    port = 10000 # airkiss port
    if smartconfig.info()[2] == smartconfig.TYPE_ESPTOUCH:
        data += inet_pton(local_ip)
        port = 18266 # esptouch port
    print(
f"""- sending ack:
    type: {'esptouch' if smartconfig.info()[2] == smartconfig.TYPE_ESPTOUCH else 'airkiss'}
    port: {port}
    data: {data}
    length: {len(data)}
"""
    )
    for _ in range(20):
        time.sleep_ms(100)
        try:
            udp.sendto(data, ('255.255.255.255', port))
        except OSError:
            pass
    print('- ack was sent')

# start 配网
def startSmartconfig():
    global wlan
    wlan = network.WLAN(network.STA_IF) 
    wlan.active(True)   #激活网络
    wlan.disconnect()   #断开WiFi连接
    print('- start smartconfig...')
    smartconfig.start()
    print('- waiting for success',end=' ')
    # 超时要重启 30 防止无法链接
    global smartconfig_wait_time
    wait_time=0
    while not smartconfig.success():
        wait_time=wait_time+1
        print(".",end=' ')
        time.sleep_ms(500)
        if wait_time>smartconfig_wait_time:
            print("out time soft reroot")
            sys.exit() #break 软重启设备
    print('- got smartconfig info')
    ssid, password, sc_type, token = smartconfig.info()
    print(smartconfig.info())
    # 链接wifi
    connectWifi(ssid,password)
    print(wlan.ifconfig())
    # 写入 wifi.json
    file = open ("wifi.json", "w")
    file.write('{"ssid":"'+ssid+'","passwd":"'+password+'"}')
    file.close()
    SmartconfigSend_ack(wlan.ifconfig()[0], wlan.config('mac'))


startSmartconfig()
'''
主逻辑 === start

connectUserWifi() # 链接用户配置的wifi
if wlan.ifconfig()[0]=='0.0.0.0': # 链接默认wifi
    connectDefaultWifi()
    if wlan.ifconfig()[0]=='0.0.0.0': # 切换到smartconfig
        startSmartconfig()
'''
