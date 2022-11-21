color='\033[0;32m'
nocolor='\033[0m'
pushd ~/.dotfiles > /dev/null
echo -e "${color}Building System \"$1\"...${nocolor}"
nix build .\#nixosConfigurations.$1.config.system.build.toplevel
echo -e "${color}Finished Build.${nocolor}"
if [ "$2" == "-c" ]; then
echo -e "${color}Syncing...${nocolor}"
nix-copy-closure -s nix-cache result
echo -e "${color}Finished Sync.${nocolor}"
fi
popd > /dev/null
