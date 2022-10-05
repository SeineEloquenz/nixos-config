#!/bin/bash
hostname=`hostname`
read -p "Is $hostname a new system? (y/n): " isNew && [[ $isNew == [yY] || $isNew == [nN] ]] || exit 1
echo "Setting up Nix channel..."
sudo nix-channel --add https://nixos.org/channels/nixos-unstable nixos
sudo nix-channel --update

echo "Setting up configuration"
pushd ~/.dotfiles
mkdir -p ./hosts/$hostname
popd

# Ensure configuration is set up on new machines
if [[ $isNew == [yY] ]];
then
  cp /etc/nixos/configuration.nix ~/.dotfiles/hosts/$hostname
  cp /etc/nixos/hardware-configuration.nix ~/.dotfiles/hosts/$hostname
  read -p "Setup configuration.nix in ~/.dotfiles/hosts/$hostname/ and confirm afterwards (y/n): " confirm && [[ $confirm == [yY] || $confirm == [yY][eE][sS] ]] || exit 1
fi

# Ensures sops is set up correctly
read -p "Paste the sops key content into the upcoming editor. Understood? (y/n): " confirm && [[ $confirm == [yY] || $confirm == [yY][eE][sS] ]] || exit 1
usersops=~/.config/sops/age
rootsops=/root
mkdir -p $usersops
nano $usersops/keys.txt
chmod 600 $usersops/keys.txt
sudo cp $usersops/keys.txt $rootsops/keys.txt
sudo chmod 600 $rootsops/keys.txt

echo "Applying system configuration"
# Workaround to ensure correct ownership on directory
mkdir -p ~/.ssh/keys
# Actually apply
sh ~/.dotfiles/scripts/apply-system.sh

echo "System set up, you might need to reboot for everything to work correctly"
