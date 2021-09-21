#!/usr/bin/env bash

## 目录
dir_root=/xdd
dir_shell=$dir_root/shell
dir_sample=$dir_root/sample
dir_conf=$dir_root/conf


## 文件
file_app_sample=$dir_sample/app.sample.conf
file_config_sample=$dir_sample/config.sample.yaml
file_reply_sample=$dir_sample/reply.sample.php
file_app_user=$dir_conf/app.conf
file_config_user=$dir_conf/config.yaml
file_reply_user=$dir_conf/reply.php


## 创建目录，$1：目录的绝对路径
make_dir() {
    local dir=$1
    if [[ ! -d $dir ]]; then
        mkdir -p $dir
    fi
}

## 修复配置文件
fix_config() {
    make_dir $dir_conf

    if [ ! -s $file_app_user ]; then
        echo -e "检测到 XDD-plus 端口配置文件不存在\n"
        echo -e "复制一份 $file_app_sample 为 $file_app_user\n"
        cp -fv $file_app_sample $file_app_user
        echo
    fi

    if [ ! -s $file_config_user ]; then
        echo -e "检测到 XDD-plus 配置文件不存在\n"
        echo -e "复制一份 $file_config_sample 为 $file_config_user，随后请按注释编辑你的配置文件：$file_config_user\n"
        cp -fv $file_config_sample $file_config_user
        echo
    fi

    if [ ! -s $file_reply_user ]; then
        echo -e "检测到 XDD-plus 机器人配置文件不存在\n"
        echo -e "复制一份 $file_reply_sample 为 $file_reply_user，随后请按注释编辑你的配置文件：$file_config_user\n"
        cp -fv $file_reply_sample $file_reply_user
        echo
    fi
    
}

