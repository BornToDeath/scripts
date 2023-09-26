#!/bin/bash

#####################################
# AIDot 应用程序保活脚本
#####################################

echo "========== Run AIDot keep alive script. =========="

# 开启性能提升
sudo nvpmodel -m 1

# 设置链接库路径
export LD_LIBRARY_PATH=/mnt/aidot/libs/load/:$LD_LIBRARY_PATH

rm -rf /mnt/aidot/run.log

# 调试用，正式环境一定要置为 false !!!
debug="false"

function startAIDot() {
  while true; do
    # 获取进程 PID
    pid=$(pgrep -lfa aidot_app | awk '{print $1}')
    if [ ! ${pid} ]; then
      chmod +x /mnt/aidot/aidot_app
      if [ ${debug} == "true" ]; then
        echo $(date), "========== Debug ==========" >> /mnt/aidot/run.log
        /mnt/aidot/aidot_app >> /mnt/aidot/run.log 2>&1 &
      else
#        echo $(date), "========== Release ==========" >> /mnt/aidot/run.log
        /mnt/aidot/aidot_app &
      fi
    fi
    sleep 5
  done
}

startAIDot