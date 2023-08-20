#!/bin/bash

# 读取配置
source user_config.cfg

# 更新包
sudo apt install -y openssh-client openssh-server tree expect
sudo apt update

# 启动ssh服务
sudo /etc/init.d/ssh start
ssh_pid=$(ps -e | grep sshd | awk '{print $1}')

# 检查ssh_pid是否为空
if [ -n "$ssh_pid" ]; then
    # 如果存在ssh进程，输出对应的pid
    echo "SSH进程的PID为: $ssh_pid"
else
    # 如果不存在ssh进程，输出提示信息
    echo "无SSH进程"
fi


# 创建用户test1
sudo useradd -m -s /bin/bash -p $(openssl passwd -1 $password1) $username1

# 创建用户test2
sudo useradd -m -s /bin/bash -p $(openssl passwd -1 $password2) $username2


# 设置工作目录的权限，使其归属于各自的用户
sudo chown -R $username1:$username1 /home/$username1
sudo chown -R $username2:$username2 /home/$username2
