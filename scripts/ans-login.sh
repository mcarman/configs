#!/bin/bash
target_server="server1.example.com"
whom=$(whoami)
remote_user=$(whoami)

## get target_server
# echo "enter target server, default: none"
# read target_server
## get the user name
# echo "enter user name, default: current user"
# read user_name
## get the remote user
# echo "enter ansible remote user, default: current user"
# read remote_user
##

sshcmd=$(ssh -o PasswordAuthentication=no $remote_user@$target_server "exit" 2>&1)
result=$sshcmd

if [[ $result = *"Permission denied"* ]]; then
  "ansible-playbook authorized_keys.yml --inventory $target_server, --user $whom"
fi

"ansible-playbook main.yml $target_server, --user $whoami"
