#!/bin/bash
#take backup of sshd_config
cp -av /etc/ssh/sshd_config /etc/ssh/sshd_config_$(date +%Y_%m__%H_%M_%S)
sed -n '/^Allow groups/ {/root/p}' /etc/ssh/sshd_config|grep root
if [ ! $? = 0 ]; then
        cat /etc/ssh/sshd_config | sed '/^Allow groups/ s/$/ root/' > /tmp/pp
        cat /tmp/pp > /etc/ssh/sshd_config && rm /tmp/pp
fi
