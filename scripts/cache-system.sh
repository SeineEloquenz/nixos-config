#!/bin/sh
pushd ~/.dotfiles
nix-copy-closure -s nix-cache result
popd
