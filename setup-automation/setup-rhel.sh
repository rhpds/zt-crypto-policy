#!/bin/bash

firewall-cmd --zone=public --add-service=https --permanent
firewall-cmd --reload

systemctl --now enable httpd
update-crypto-policies --set DEFAULT


#tmux shouldn't be needed, skip creating

#step 1: make a script
#tee ~/startup-tmux.sh << EOF
#TMUX='' tmux new-session -d -s 'rhel-session' > /dev/null 2>&1
#tmux set -g pane-border-status top
#tmux setw -g pane-border-format ' #{pane_index} #{pane_current_command}'
#tmux set -g mouse off
#tmux set mouse off
#EOF

#step 2: make it executable
#chmod +x ~/startup-tmux.sh
#step 3: use cron to execute 
#echo "@reboot ~/startup-tmux.sh" | crontab -

#step 4: start tmux for the lab
#~/startup-tmux.sh

echo "DONE" >> /root/post-run.log
