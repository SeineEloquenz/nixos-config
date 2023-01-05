{ pkgs, config, ... }:

{
  environment.systemPackages = [
    pkgs.vscodium
  ];

  home-manager.users.alexa = {
    programs.vscode = {
      enable = true;
      package = pkgs.vscodium;
      extensions = with pkgs.vscode-extensions; [
        redhat.vscode-yaml
        ms-python.python
        ms-azuretools.vscode-docker
        haskell.haskell
        jnoortheen.nix-ide
        arrterian.nix-env-selector
      ];
    };

    home.file.".local/share/applications/codium.desktop".text = ''
      [Desktop Entry]
      Actions=new-empty-window
      Categories=Utility;TextEditor;Development;IDE
      Comment=Code Editing. Redefined.
      Exec=codium --disable-gpu %F
      GenericName=Text Editor
      Icon=code
      Keywords=vscode
      MimeType=text/plain
      Name=VSCodium
      StartupNotify=true
      StartupWMClass=vscodium
      Type=Application
      Version=1.4

      [Desktop Action new-empty-window]
      Exec=codium --new-window %F
      Icon=code
      Name=New Empty Window
    '';
  };
}
