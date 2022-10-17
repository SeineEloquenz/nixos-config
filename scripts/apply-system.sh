#!/bin/sh
if [ "$1" == "-c" ]; then
  arg="--option extra-substituters http://nix-cache.internal.mondcarion.group:5000"
  pkgs=nixos-rebuild dry-build --flake . |& sed '0,/^these .* paths will be fetched .*$/d'
  if [ "$pkgs" != "" ]; then
    nix copy -s --from https://cache.nixos.org --to ssh://nix-cache $pkgs
  fi
else
  arg=""
fi
pushd ~/.dotfiles
  nixos-rebuild build $arg --flake . && sudo nixos-rebuild switch --flake .
  if [ "$1" == "-c" ]; then
    sh ./scripts/cache-system.sh
  fi
popd
