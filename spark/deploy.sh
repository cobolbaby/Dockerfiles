#!/bin/bash
. ./init.sh

# 传出配置文件
ansible -i $INVENTORY_FILE master -m copy -a "src=deploy/ dest=/opt/sparkv2" -b

# 执行启动命令
ansible -i $INVENTORY_FILE master -m command -a "/opt/sparkv2/start.sh ${REGISTRY} ${TAGNAME}" -b