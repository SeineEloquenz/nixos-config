{ config, pkgs, ... }:{

  home-manager.users.alexa.home.file = {
    ".local/share/applications/schildichat-desktop.desktop".text = ''
      [Desktop Entry]
      Categories=Network;InstantMessaging;Chat
      Comment=Matrix client / Element Desktop fork
      Exec=schildichat-desktop --disable-gpu %u
      GenericName=Matrix Client
      Icon=schildichat
      MimeType=x-scheme-handler/element
      Name=SchildiChat
      StartupWMClass=schildichat
      Type=Application
      Version=1.4
    '';
  };
}
