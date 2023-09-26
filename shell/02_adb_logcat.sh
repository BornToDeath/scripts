#!/bin/bash

########################
# 查看 adb logcat 日志
########################

cd $(dirname $0) || exit

pkg_name="com.autonavi.socol"
if [ "$1" == "1" ]; then
  pkg_name="com.socol"
fi
echo ${pkg_name}

while true; do
    pid=$(adb shell ps | grep ${pkg_name} | awk '{print $2}')
    if [ ! "${pid}" ]; then
        echo "$(date +'%Y%m%d %H:%M:%S') | 没有PID!"
        sleep 1
    else
        break
    fi
done

echo "PID: ${pid}"
adb logcat | grep "${pid}"
