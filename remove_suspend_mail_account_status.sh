#!/bin/bash
## Lista todas as contas de e-mail e deleta as contas suspensas

uapi --user=<USER_CPANEL> Email list_pops | sed "s/\n//g" > list_contas
echo "" > delete_log

for mailaccount in `cat /opt/limpaconta/list_contas | sed "s/\s//g"`; do
    if [[ $mailaccount =~ ^login: ]]; then
	suspenso=`echo "$mailaccount" | sed "s/login://g"`
    fi
    if [[ $mailaccount =~ ^suspended_incoming:1 ]]; then
	echo "$suspenso suspensa -> por estar: $mailaccount" >> delete_log
	echo "uapi --user=<USER_CPANEL> Email delete_pop email=$suspenso"
    fi
done
