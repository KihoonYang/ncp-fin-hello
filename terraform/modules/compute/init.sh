#!/bin/bash
useradd devops
echo 'devopsPasswor1d' | passwd --stdin hroadm
cp -a /etc/sudoers /etc/sudoers.bak
 echo "devops ALL=(ALL)       NOPASSWD: ALL" >> /etc/sudoers

 mkdir -p /root/script_bak
cp -a /etc/yum.conf /root/script_bak/yum.conf.bak
sed -i "s/exclude=xe-guest-utilities*/exclude=xe-guest-utilities*,kernel*,centos-release*/g" /etc/yum.conf
cp -a /etc/sysconfig/kernel /root/script_bak/kernel.bak
sed -i "s/UPDATEDEFAULT=yes/UPDATEDEFAULT=no/g" /etc/sysconfig/kernel

cp -a /etc/profile /root/script_bak/profile.bak
echo "export HISTTIMEFORMAT='%y/%m/%d %H:%M:%S '" >> /etc/profile
sed -i "s/HISTSIZE=500/HISTSIZE=100000/g"  /etc/profile
sed -i "s/HISTFILESIZE=0//g" /etc/profile

cp -a /etc/security/limits.conf /root/script_bak/limits.conf.bak 
echo "*                soft    nofile          32768" >> /etc/security/limits.conf
echo "*                hard    nofile          65535"  >> /etc/security/limits.conf
echo "*                soft    nproc           32768" >> /etc/security/limits.conf
echo "*                hard    nproc           65535" >> /etc/security/limits.conf
echo "*                soft    stack           65536" >> /etc/security/limits.conf
echo "*                hard    stack           65536" >> /etc/security/limits.conf
echo "*                soft    core            unlimited" >> /etc/security/limits.conf
echo "*                hard    core            unlimited" >> /etc/security/limits.conf
echo "*                soft    memlock         unlimited" >> /etc/security/limits.conf
echo "*                hard    memlock         unlimited" >> /etc/security/limits.conf

cp -a /etc/sysctl.conf /root/script_bak/sysctl.conf.bak 
echo "net.ipv4.tcp_mem = 8192 87380 16777216" >> /etc/sysctl.conf 
echo "net.ipv4.tcp_keepalive_time = 180" >> /etc/sysctl.conf 
echo "net.ipv4.tcp_timestamps = 1" >> /etc/sysctl.conf 
echo "net.ipv4.tcp_fin_timeout = 15" >> /etc/sysctl.conf 
echo "net.ipv4.tcp_keepalive_intvl = 30" >> /etc/sysctl.conf 
echo "net.ipv4.tcp_keepalive_probes = 5" >> /etc/sysctl.conf 
echo "net.ipv4.tcp_max_syn_backlog = 8192" >> /etc/sysctl.conf 
echo "net.ipv4.tcp_syncookies = 1" >> /etc/sysctl.conf 
echo "net.ipv4.tcp_syn_retries = 2" >> /etc/sysctl.conf 
echo "net.ipv4.tcp_retries2 = 2" >> /etc/sysctl.conf 
echo "net.core.rmem_max = 16777216" >> /etc/sysctl.conf 
echo "net.core.wmem_max = 16777216" >> /etc/sysctl.conf 
echo "net.core.rmem_default = 16777216" >> /etc/sysctl.conf 
echo "net.core.wmem_default = 16777216" >> /etc/sysctl.conf 
echo "net.core.optmem_max = 16777216" >> /etc/sysctl.conf 
echo "net.core.somaxconn = 8192" >> /etc/sysctl.conf 
echo "net.core.netdev_max_backlog = 32768" >> /etc/sysctl.conf 
echo "net.ipv4.tcp_window_scaling = 1" >> /etc/sysctl.conf 
echo "net.ipv4.tcp_sack = 1" >> /etc/sysctl.conf 
echo "kernel.sysrq = 1" >> /etc/sysctl.conf 
echo "kernel.msgmnb = 65536" >> /etc/sysctl.conf 
echo "kernel.msgmax = 65536" >> /etc/sysctl.conf 
echo "kernel.msgmni = 2878" >> /etc/sysctl.conf  
echo "kernel.sem = 1000 32000 100 512" >> /etc/sysctl.conf 
echo "kernel.shmmni = 4096" >> /etc/sysctl.conf 
echo "kernel.pid_max = 65536" >> /etc/sysctl.conf 
echo "fs.file-max = 8000000" >> /etc/sysctl.conf 
echo "vm.swappiness = 10" >> /etc/sysctl.conf 
sysctl -p 

setenforce 0 
sed -i "s/SELINUX=enforcing/SELINUX=disabled/g" /etc/selinux/config 

systemctl disable firewalld 
systemctl stop firewalld 

ln -sf /usr/share/zoneinfo/Asia/Seoul /etc/localtime 