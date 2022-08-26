# General
Add sops and home-manager channels:
```
sudo nix-channel --add https://github.com/Mic92/sops-nix/archive/master.tar.gz sops-nix
sudo nix-channel --add https://github.com/nix-community/home-manager/archive/master.tar.gz home-manager
sudo nix-channel --update
```

Get sops key from pw manager and put it in ```/root/keys.txt```

# Setup an existing machine
1. Clone the repository into ```~/.dotfiles```
2. Create a symlink ```system/configuration.nix``` pointing to ```system/machines/<machine>/configuration.nix```
3. Create a symlink ```users/alexa/home.nix``` pointing to  ```users/alexa/machines/<machine>/home.nix```
4. Apply system
5. Install home-manager ```nix-shell '<home-manager>' -A install```
6. Apply users

# Setup a new machine
1. Clone the repository into ```~/.dotfiles```
2. Copy the nix configurations of your new machine to ```system/<machine>```
3. Edit the configuration accordingly
4. Commit and Push your changes
5. Create a symlink ```system/configuration.nix``` pointing to ```system/machines/<machine>/configuration.nix```
6. Create a symlink ```users/alexa/home.nix``` pointing to  ```users/alexa/machines/<machine>/home.nix```
7. Apply system  
8. Install home-manager ```nix-shell '<home-manager>' -A install```
9
. Apply users
