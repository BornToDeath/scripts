#!/bin/bash

##################################
# 查看进程状态
##################################

# 获取进程 PID
pid=$(pgrep -lfa runCommunication | awk '{print $1}')
if [ ! ${pid} ]; then
    exit
fi
echo "PID: ${pid}"

# 查看进程状态
#top -p ${pid}

# 查看进程占用内存
watch -d -n 1 "cat /proc/"${pid}"/status | grep VmRSS"

# 查看进程有几个线程
#ps -T -p ${pid}

# 查看 CPU 温度
#watch -d -n 1 sensors