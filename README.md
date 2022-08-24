# General
Add the sops channel:
```sudo nix-channel --add https://github.com/Mic92/sops-nix/archive/master.tar.gz sops-nix```
```sudo nix-channel --update```

# Setup an existing machine
1. Clone the repository into ```~/.dotfiles```
2. Create a symlink ```system/configuration.nix``` pointing to ```system/<machine>/configuration.nix```
3. Create a symlink ```users/alexa/home.nix``` pointing to  ```users/alexa/<machine>/configuration.nix```

# Setup a new machine
1. Clone the repository into ```~/.dotfiles```
2. Copy the nix configurations of your new machine to ```system/<machine>```
3. Edit the configuration accordingly
4. Commit and Push your changes
5. Create a symlink ```system/configuration.nix``` pointing to ```system/<machine>/configuration.nix```
6. Create a symlink ```users/alexa/home.nix``` pointing to  ```users/alexa/<machine>/configuration.nix```
