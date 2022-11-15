nix build .\#nixosConfigurations.$1.config.system.build.toplevel | nix-copy-closure -s nix-cache result
