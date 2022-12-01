#!/bin/bash
read -p "Enter hostname: " hostname
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
  read -p "Setup configuration.nix in the upcoming prompt (y/n): " confirm && [[ $confirm == [yY] || $confirm == [yY][eE][sS] ]] || exit 1
  nano ~/.dotfiles/hosts/$hostname/configuration.nix
fi

# Ensures sops is set up correctly
read -p "Log into the password manager in the upcoming prompts. Understood? (y/n): " confirm && [[ $confirm == [yY] || $confirm == [yY][eE][sS] ]] || exit 1
nix-shell bootstrap.nix --run "bash ~/.dotfiles/setup-sops.sh"

echo "Applying system configuration"
# Workaround to ensure correct ownership on directory
mkdir -p ~/.ssh/keys
# Actually apply
sh ~/.dotfiles/scripts/apply-system.sh

echo "Changing upstream to ssh url"
git remote set-url origin git@github.com:SeineEloquenz/nixos-config.git

echo "System set up, you might need to reboot for everything to work correctly"
