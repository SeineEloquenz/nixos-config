#!/bin/sh
pushd ~/.dotfiles
home-manager switch -f ./users/alexa/home.nix
popd
