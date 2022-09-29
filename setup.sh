#!/bin/bash
read -p "Enter the system's hostname: " hostname
read -p "Is this a new system? (y/n): " isNew && [[ $isNew == [yY] || $isNew == [nN] ]] || exit 1
echo "Setting up Nix channels..."
sudo nix-channel --add https://nixos.org/channels/nixos-unstable nixos
sudo nix-channel --add https://github.com/Mic92/sops-nix/archive/master.tar.gz sops-nix
sudo nix-channel --add https://github.com/nix-community/home-manager/archive/master.tar.gz home-manager
sudo nix-channel --update

echo "Setting up configuration"
pushd ~/.dotfiles/system
mkdir -p ./machines/$hostname
ln -sf ./machines/$hostname/configuration.nix ./configuration.nix
popd
pushd ~/.dotfiles/users/alexa
mkdir -p ./machines/$hostname
ln -sf ./machines/$hostname/home.nix ./home.nix
popd

# Ensure configuration is set up on new machines
if [[ $isNew == [yY] ]];
then
  cp /etc/nixos/configuration.nix ~/.dotfiles/system/machines/$hostname
  cp /etc/nixos/hardware-configuration.nix ~/.dotfiles/system/machines/$hostname
  read -p "Setup configuration.nix in ~/.dotfiles/system/machines/$hostname/ and confirm afterwards (y/n): " confirm && [[ $confirm == [yY] || $confirm == [yY][eE][sS] ]] || exit 1
  read -p "Setup ~/.dotfiles/users/alexa/machines/$hostname/home.nix and confirm afterwards (y/n): " confirm && [[ $confirm == [yY] || $confirm == [yY][eE][sS] ]] || exit 1
fi

# Ensures sops is set up correctly
read -p "Paste the sops key content into the upcoming editor. Understood? (y/n): " confirm && [[ $confirm == [yY] || $confirm == [yY][eE][sS] ]] || exit 1
sudo nano /root/keys.txt
read -p "Sops key pasted correctly? (y/n): " confirm && [[ $confirm == [yY] || $confirm == [yY][eE][sS] ]] || exit 1

echo "Applying system configuration"
sh ~/.dotfiles/scripts/apply-system.sh

echo "Installing home-manager"
nix-shell '<home-manager>' -A install

echo "Applying user configuration"
sh ~/.dotfiles/scripts/apply-users.sh

echo "System set up, you might need to reboot for everything to work correctly"
