#!/bin/bash

# 更新包
sudo apt install -y openssh-client openssh-server tree
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
sudo useradd -m -s /bin/bash -p $(openssl passwd -1 "test1111") test1

# 创建用户test2
sudo useradd -m -s /bin/bash -p $(openssl passwd -1 "test2222") test2

# 设置工作目录的权限，使其归属于各自的用户
sudo chown -R test1:test1 /home/test1
sudo chown -R test2:test2 /home/test2

# 设置他人不可读
sudo chmod o+wr /home/test1
sudo chmod o+wr /home/test2

cd /home
ll -a

echo "用户和工作目录创建完成！"

# test1中创建文件
sudo echo "123456" > /home/test1/file1
sudo mkdir -p /home/test1/dir1/dir1_1
sudo echo "123456" > /home/test1/dir1/file1_1
sudo echo "123456" > /home/test1/dir1/file1_2

# test2中创建文件
sudo echo "123456" > /home/test2/file1
sudo mkdir -p /home/test2/dir1/dir1_1
sudo echo "123456" > /home/test2/dir1/file1_1
sudo echo "123456" > /home/test2/dir1/file1_2

# 到 /home/test1 和 /home/test2 目录下
cd /home/test1
tree
cd /home/test2
tree

# 设置他人不可读
sudo chmod o-wr /home/test1
sudo chmod o-wr /home/test2
