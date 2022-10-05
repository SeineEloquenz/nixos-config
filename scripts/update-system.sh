#!/bin/sh
pushd ~/.dotfiles
git pull
nix flake update
git add flake.nix
git add flake.lock
git commit -m "Update inputs"
git push
popd
