#!/bin/sh
pushd ~/.dotfiles > /dev/null
git pull
nix flake update
git add flake.nix
git add flake.lock
git commit -m "Update inputs"
if [ "$1" == "-p" ]; then
    git push
fi
popd > /dev/null
