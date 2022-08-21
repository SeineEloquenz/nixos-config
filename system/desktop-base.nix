{ config, pkgs, ... }:

{
  # Enable networking
  networking.networkmanager.enable = true;

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

  # Enable CUPS to print documents.
  services.printing.enable = true;

  services.xserver.excludePackages = with pkgs; [
    xterm
  ];

  environment.systemPackages = with pkgs; [
    layan-kde
    layan-gtk-theme
    tela-icon-theme
    firefox
  ];

  # Fonts

  fonts.fonts = with pkgs; [
    noto-fonts
    roboto
    roboto-mono
    emojione
    montserrat
    (nerdfonts.override { fonts = ["RobotoMono"]; })
  ];
  fonts.enableDefaultFonts = true;
  fonts.fontconfig.defaultFonts = {
    monospace = ["Roboto Mono"];
    sansSerif = ["Montserrat Regular"];
    serif = ["Noto Serif"];
  };

}

