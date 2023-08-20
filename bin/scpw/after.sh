#!/bin/bash

# 读取配置
source user_config.cfg

echo "用户和工作目录创建完成！"

# 到 /home/test1 和 /home/test2 目录下
cd /home/$username1
sudo tree -hp

cd /home/$username2
sudo tree -hp
