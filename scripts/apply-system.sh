#!/bin/sh
if [ "$1" == "-c" ]; then
arg="--option extra-substituters http://nix-cache.internal.mondcarion.group:5000"
else
arg=""
fi
pushd ~/.dotfiles
nixos-rebuild build $arg --flake . && sudo nixos-rebuild switch --flake .
if [ "$1" == "-c" ]; then
sh ./scripts/cache-system.sh
fi
popd
