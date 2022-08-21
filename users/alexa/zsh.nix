{ config, pkgs, ... }:

{
  xdg.configFile."zsh/.p10k.zsh".source = ~/.dotfiles/files/.p10k.zsh;

  programs.zsh = {
    enable = true;
    autocd = true;
    enableAutosuggestions = true;
    enableCompletion = true;
    dotDir = ".config/zsh";
    shellAliases = {
      ip = "ip --color=auto";
    };

    history = {
      ignoreSpace = true;
      expireDuplicatesFirst = true;
      save = 100000000;
      size = 1000000000;
    };

    initExtraBeforeCompInit = ''
      # p10k instant prompt
      P10K_INSTANT_PROMPT="$XDG_CACHE_HOME/p10k-instant-prompt-''${(%):-%n}.zsh"
      [[ ! -r "$P10K_INSTANT_PROMPT" ]] || source "$P10K_INSTANT_PROMPT"
      [[ ! -f ~/.config/zsh/.p10k.zsh ]] || source ~/.config/zsh/.p10k.zsh
      # ctrl-backspace kills word
      bindkey '^H' backward-kill-word 
    '';

    zplug = {
      enable = true;
      plugins = [
        { name = "zsh-users/zsh-autosuggestions"; }
        { name = "romkatv/powerlevel10k"; tags = [ as:theme depth:1 ]; }
      ];
    };
  };
}
