#!/bin/bash

# 等待网络稳定
sleep 6

# 循环访问所有节点并将 SSH 公钥复制到它们
for HOST in node1 node2 node3; do
    sshpass -p '1111' ssh-copy-id -f -o StrictHostKeyChecking=no -i /root/.ssh/id_rsa.pub root@$HOST
    sleep 0.5
done
