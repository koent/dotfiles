#!/usr/bin/python3
from pydbus import SessionBus

bus = SessionBus()
devid = bus.get("org.kde.kdeconnect","/modules/kdeconnect").devices()[0]
dev = bus.get("org.kde.kdeconnect", "/modules/kdeconnect/devices/%s" % devid)

if dev.isReachable:
	opladen = "↑" if dev.isCharging() else "↓"
	print("{}%{}".format(dev.charge(), opladen))
	print("{}%{}".format(dev.charge(), opladen))
	if dev.isCharging() and dev.charge() == 100:
		print("#00FF00")
else:
	print("niet verbonden\n--\n#AAAAAA")
