import wifimgr # 这个模块名称务必要与上述WiFiManager模块文件名一致
wlan = wifimgr.get_connection()
if wlan is None:
    print("Could not initialize the network connection.")
    while True:
        pass  # you shall not pass :D
# Main Code goes here, wlan is a working network.WLAN(STA_IF) instance.
print("ESP OK")