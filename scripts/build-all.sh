#!/bin/sh
hosts=$(ls ~/.dotfiles/hosts)
for host in $hosts
do
	sh ~/.dotfiles/scripts/build-system.sh $host
done
