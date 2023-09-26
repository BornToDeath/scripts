#!/bin/bash

##################################
#
# 统计进程占用的内存情况，并输出到文件
#
##################################


# # 获取进程 PID
# pid=$(adb shell ps | grep runLZMA | awk '{print $2}')
# if [ ! ${pid} ]; then
#     echo "没有PID!"
#     exit
# fi
# echo "PID: ${pid}"

filename="mem.log"
echo "=========================================" >> ${filename}

# 查看进程占用内存，并保存至文件
# echo $(date "+%Y-%m-%d %H:%M:%S"), VmHWM VmRSS
while ((1)) 
do
    # 获取进程 PID
    pid=$(adb shell ps | grep socol | awk '{print $2}')
    if [ ! ${pid} ]; then
        echo "没有PID!"
        sleep 1
        continue
    fi
    # echo "PID: ${pid}"
    curTime=$(date "+%Y-%m-%d %H:%M:%S")
    mem=$(adb shell cat /proc/"${pid}"/status | grep -E "VmHWM|VmRSS" | awk '{print $2}')
    cpu=$(adb shell top -n 1 -d 1 | grep ${pid} | awk '{print $3}')
    echo ${curTime} '| PID: '$pid '| Mem: '${mem} '| CPU: '${cpu} | tee -a ${filename}
    # sleep 1
done
