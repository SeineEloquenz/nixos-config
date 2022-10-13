#!/bin/sh
if [ "$1" == "-c" ]; then
arg="--option substituters ssh://nix-cache"
else
arg=""
fi
pushd ~/.dotfiles
nixos-rebuild build $arg --flake . && sudo nixos-rebuild switch --flake .
if [ "$1" == "-c" ]; then
sh ./scripts/cache-system.sh
fi
popd
