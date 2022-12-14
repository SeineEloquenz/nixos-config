{ config, pkgs, ... }:

{
  imports =
    [
      ./android.nix
      ./bitwarden.nix
      ./printing.nix
      ./networking.nix
      ./audio.nix
      ./electron.nix
      ./firefox.nix
    ];

  environment.sessionVariables = rec {
    # XDG variables
    XDG_CACHE_HOME  = "\${HOME}/.cache";
    XDG_CONFIG_HOME = "\${HOME}/.config";
    XDG_BIN_HOME    = "\${HOME}/.local/bin";
    XDG_DATA_HOME   = "\${HOME}/.local/share";

    PATH = [ 
      "\${XDG_BIN_HOME}"
    ];
  };

  # Enable the X11 windowing system.
  services.xserver.enable = true;

  # Configure keymap in X11
  services.xserver = {
    layout = "de";
    xkbVariant = "";
    xkbModel = "pc105";
  };

  # Enable automatic login for the user. - we always use luks, therefore we don't want to enter pws twice
  services.xserver.displayManager.autoLogin.enable = true;
  services.xserver.displayManager.autoLogin.user = "alexa";

  # Enable touchpad support (enabled default in most desktopManager).
  services.xserver.libinput.enable = true;

  # Enable sound with pipewire.
  sound.enable = true;
  hardware.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    # If you want to use JACK applications, uncomment this
    #jack.enable = true;

    # use the example session manager (no others are packaged yet so this is enabled by default,
    # no need to redefine it in your config for now)
    #media-session.enable = true;
  };

  services.xserver.excludePackages = with pkgs; [
    xterm
  ];

  environment.systemPackages = with pkgs; [
    # Utils
    scanmem
    jdk
    # Desktop apps
    neofetch
    nextcloud-client
    gimp
    inkscape
    schildichat-desktop
    fragments
    AusweisApp2
    tor-browser-bundle-bin
  ];
}

