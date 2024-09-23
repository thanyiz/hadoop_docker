#!/bin/bash

echo "hello"
while true; do
    all_connected=true

    for HOST in node1 node2 node3; do
        if ! sshpass -p '1111' ssh -o ConnectTimeout=1 -o StrictHostKeyChecking=no root@$HOST exit; then
            all_connected=false
            break
        fi
    done

    if [ "$all_connected" = true ]; then
        for HOST in node1 node2 node3; do
            sshpass -p '1111' ssh-copy-id -f -o StrictHostKeyChecking=no -i /root/.ssh/id_rsa.pub root@$HOST
        done
        echo "all_connected"
        break
    fi
done