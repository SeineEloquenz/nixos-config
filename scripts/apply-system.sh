#!/bin/sh
pushd ~/.dotfiles
sudo nixos-rebuild build --flake .
cachix push mcg-cache result
sudo nixos-rebuild switch --flake . $@
popd
