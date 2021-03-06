#!/bin/sh
### BEGIN INIT INFO
# Provides:             dmesg
# Required-Start:
# Required-Stop:
# Default-Start:        S
# Default-Stop:
### END INIT INFO

if [ -f /var/log/dmesg ]; then
	if [ -f /usr/sbin/logrotate -a -f /var/log/dmesg ]; then
		logrotate -f /etc/logrotate-dmesg.conf -s /dev/null
	else
		mv -f /var/log/dmesg /var/log/dmesg.old
	fi
fi
dmesg -s 131072 > /var/log/dmesg
