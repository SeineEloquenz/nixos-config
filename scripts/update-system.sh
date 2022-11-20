#!/bin/sh
pushd ~/.dotfiles > /dev/null
git pull
nix flake update
git add flake.nix
git add flake.lock
git commit -m "Update inputs"
git push
popd > /dev/null
