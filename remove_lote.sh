#!/bin/bash
## Insira a lista de contas a ser removida em /opt/limpaconta/remover.list

for mailaccount in `awk -F "@" '{print $1}' /opt/limpaconta/remover.list`; do
    uapi --user=<USER_CPANEL> Email delete_pop email=$mailaccount
#    read -n1 -r -p "Press any key to continue...\n" key
done

echo "Se deu ruim... fudeu..."
