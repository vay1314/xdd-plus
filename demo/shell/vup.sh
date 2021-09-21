#!/usr/bin/env bash

##判断 JDC类型
echo "下载最新 XDD-plus 主程序/n"
wget https://ghproxy.com/https://raw.githubusercontent.com/vay1314/xdd-v-plus/main/demo/XDD-plus -O /xdd/demo/XDD-plus-new
echo "停止正在运行的 XDD-plus /n"
pm2 stop XDD-plus
echo "替换 XDD-plus /n"
cp -rf /xdd/demo/XDD-plus-new /xdd/XDD-plus
chmod 777 /xdd/XDD-plus
rm -rf /xdd/demo/XDD-plus-new
echo "重新启动 XDD-plus /n"
pm2 restart XDD-plus

exit 0
