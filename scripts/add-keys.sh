#!/bin/bash
sudo cp keys.txt /root
sudo chmod 600 /root/keys.txt
mkdir -p ~/.config/sops/age
cp keys.txt ~/.config/sops/age
chmod 600 ~/.config/sops/age/keys.txt
rm keys.txt
