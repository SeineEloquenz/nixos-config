#!/bin/bash
usersops=~/.config/sops/age
rootsops=/root
mkdir -p $usersops
rbw get "sops key" > $usersops/keys.txt
chmod 600 $usersops/keys.txt
rbw get "sops key" | sudo tee $rootsops/keys.txt > /dev/null
sudo chmod 600 $rootsops/keys.txt
rm -r ~/.local/share/rbw
