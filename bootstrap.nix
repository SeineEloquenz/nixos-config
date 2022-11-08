with (import <nixpkgs> {});

let
  email = "alexander.linder@mondcarion.group";
  base_url = "https://pass.mondcarion.group";
  lock_timeout = "30";
in mkShell {
  buildInputs = [
    rbw
  ];
  shellHook = ''
    rbw config set "email" "${email}"
    rbw config set "base_url" "${base_url}"
    rbw config set "lock_timeout" ${lock_timeout}
  '';
}
