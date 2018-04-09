#!/bin/bash
## Coloque a lista de e-mail em /opt/limpaconta/suspend.list

for mailaccount in `cat /opt/limpaconta/suspend.list`; do
    uapi --user=ensitec Email suspend_login email=$mailaccount
    uapi --user=ensitec Email suspend_incoming email=$mailaccount
done
