#!/bin/sh
color='\033[0;32m'
nocolor='\033[0m'
if [ "$1" == "-c" ]; then
  arg="--option extra-substituters http://nix-cache.internal.mondcarion.group:5000"
  pkgs=nixos-rebuild dry-build --flake . |& sed '0,/^these .* paths will be fetched .*$/d'
  if [ "$pkgs" != "" ]; then
    echo -e "${color}Syncing nix-cache from upstream...$nocolor"
    nix copy -s --from https://cache.nixos.org --to ssh://nix-cache $pkgs
    echo -e "${color}Finished.$nocolor"
  fi
else
  arg=""
fi
pushd ~/.dotfiles
  echo -e "${color}Rebuilding system...$nocolor"
  nixos-rebuild build $arg --flake . && sudo nixos-rebuild switch --flake .
  echo -e "${color}Finished.$nocolor"
  if [ "$1" == "-c" ]; then
    echo -e "${color}Syncing built packages to nix-cache...$nocolor"
    sh ./scripts/cache-system.sh
    echo -e "${color}Finished.$nocolor"
  fi
popd
