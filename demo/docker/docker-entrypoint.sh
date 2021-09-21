#!/bin/bash
set -e

dir_shell=/xdd/shell
. $dir_shell/share.sh

echo -e "======================1. 检测配置文件========================\n"
fix_config
echo

echo -e "======================2. 启动 XDD-plus ======================\n"
if [[ $ENABLE_WEB_XDD == true ]]; then
        pm2 start XDD-plus
        echo -e "XDD-plus面板启动成功...\n"
        echo -e "访问5701端口，即可登陆面板管理."
elif [[ $ENABLE_WEB_XDD == false ]]; then
    echo -e "已设置为不自动启动XDD-plus面板...\n"
    echo -e "默认首次不启动 XDD 面板，请编辑好配置文件后，修改环境变量为true启动面板\n"
fi

echo -e "############################################################\n"

crond -f >/dev/null

exec "$@"