with (import <nixpkgs> {});
mkShell {
  buildInputs = [
    rbw
  ];
  shellHook = ''
    rbw config set "email" "alexander.linder@mondcarion.group"
    rbw config set "base_url" "https://pass.mondcarion.group"
    rbw config set "lock_timeout": 30
  '';
}
