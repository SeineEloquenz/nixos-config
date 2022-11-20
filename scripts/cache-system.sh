#!/bin/sh
pushd ~/.dotfiles > /dev/null
nix-copy-closure -s nix-cache result
popd > /dev/null
