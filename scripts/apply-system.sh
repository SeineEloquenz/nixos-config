#!/bin/sh
pushd ~/.dotfiles
sudo nixos-rebuild build --flake . && sudo nixos-rebuild switch --flake . $@ && cachix push mcg-cache result
popd
