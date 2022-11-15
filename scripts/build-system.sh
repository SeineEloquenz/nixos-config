color='\033[0;32m'
nocolor='\033[0m'
pushd ~/.dotfiles
echo -e "${color}Building System \"$1\"...${nocolor}"
nix build .\#nixosConfigurations.$1.config.system.build.toplevel
echo -e "${color}Finished Build. Syncing...${nocolor}"
nix-copy-closure -s nix-cache result
echo -e "${color}Finished Sync.${nocolor}"
popd
