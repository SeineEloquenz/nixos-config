#!/bin/sh
pushd ~/.nixos-config
home-manager switch -f ./users/alexa/home.nix
popd
