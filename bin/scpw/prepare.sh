#!/bin/bash

# 更新包
apt install -y openssh-client openssh-server tree
apt update

# 启动ssh服务
/etc/init.d/ssh start
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
useradd -m -s /bin/bash -p $(openssl passwd -1 "test1111") test1

# 创建用户test2
useradd -m -s /bin/bash -p $(openssl passwd -1 "test2222") test2

# 设置工作目录的权限，使其归属于各自的用户
chown -R test1:test1 /home/test1/workspace
chown -R test2:test2 /home/test2/workspace

# 设置他人不可读
chmod o-r /home/test1
chmod o-r /home/test2

echo "用户和工作目录创建完成！"

# test1中创建文件
echo "123456" > /home/test1/file1
mkdir -p /home/test1/dir1/dir1_1
echo "123456" > /home/test1/dir1/file1_1
echo "123456" > /home/test1/dir1/file1_2

# test2中创建文件
echo "123456" > /home/test2/file1
mkdir -p /home/test2/dir1/dir1_1
echo "123456" > /home/test2/dir1/file1_1
echo "123456" > /home/test2/dir1/file1_2

# 到home目录下
cd /home
tree
