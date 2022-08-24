{ config, pkgs, lib, ... }:

{
  programs.zsh = {
    enable = true;

    shellAliases = {
      asystem = "sh ~/.dotfiles/apply-system.sh";
      ausers = "sh ~/.dotfiles/apply-users.sh";
      usystem = "sh ~/.dotfiles/update-system.sh";
      uusers = "sh ~/.dotfiles/update-users.sh";
      home-manager = "home-manager -f ~/.dotfiles/users/alexa/home.nix";
      sops-edit = "nix-shell -p sops --run \"sops ~/.dotfiles/.secrets/secrets.yaml\"";
    };

    initExtraFirst = ''
      [ ! -d "$HOME/.zsh/fsh/" ] && mkdir $HOME/.zsh/fsh/
      export FAST_WORK_DIR=$HOME/.zsh/fsh/;
    '';

    initExtraBeforeCompInit = ''
      # Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
      # Initialization code that may require console input (password prompts, [y/n]
      # confirmations, etc.) must go above this block; everything else may go below.
      P10K_INSTANT_PROMPT="/home/alexa/.cache/p10k-instant-prompt-alexa.zsh"
      [[ ! -r "$P10K_INSTANT_PROMPT" ]] || source "$P10K_INSTANT_PROMPT"
      [[ ! -f ~/.config/zsh/.p10k.zsh ]] || source ~/.config/zsh/.p10k.zsh
      setopt extendedglob                                             # Extended globbing. Allows using regular expressions with *
      setopt nocaseglob                                               # Case insensitive globbing
      setopt rcexpandparam                                            # Array expension with parameters
      setopt numericglobsort                                          # Sort filenames numerically when it makes sense
      setopt nobeep                                                   # No beep

      # key bindings
      bindkey '^[[7~' beginning-of-line                               # Home key
      bindkey '^[[H' beginning-of-line                                # Home key
      bindkey '^[[8~' end-of-line                                     # End key
      bindkey '^[[F' end-of-line                                     # End key
      bindkey '^[[3~' delete-char                                     # Delete key
      bindkey '^[[3~' delete-char                                     # Delete key
      bindkey '^[[C'  forward-char                                    # Right key
      bindkey '^[[D'  backward-char                                   # Left key
      bindkey '^[[5~' history-beginning-search-backward               # Page up key
      bindkey '^[[6~' history-beginning-search-forward                # Page down key
      bindkey '^H' backward-kill-word 

      # Navigate words with ctrl+arrow keys
      bindkey '^[Oc' forward-word                                     #
      bindkey '^[Od' backward-word                                    #
      bindkey '^[[1;5D' backward-word                                 #
      bindkey '^[[1;5C' forward-word                                  #
      bindkey '^[[Z' undo                                             # Shift+tab undo last action
      # Color man pages
      export LESS_TERMCAP_mb=$'\E[01;32m'
      export LESS_TERMCAP_md=$'\E[01;32m'
      export LESS_TERMCAP_me=$'\E[0m'
      export LESS_TERMCAP_se=$'\E[0m'
      export LESS_TERMCAP_so=$'\E[01;47;34m'
      export LESS_TERMCAP_ue=$'\E[0m'
      export LESS_TERMCAP_us=$'\E[01;36m'
      export LESS=-R
     '';

    plugins = [
      {
        name = "zsh-autosuggestions";
        src = pkgs.fetchFromGitHub {
          owner = "zsh-users";
          repo = "zsh-autosuggestions";
          rev = "v0.6.4";
          sha256 = "0h52p2waggzfshvy1wvhj4hf06fmzd44bv6j18k3l9rcx6aixzn6";
        };
      }

      {
        name = "fast-syntax-highlighting";
        src = pkgs.fetchFromGitHub {
          owner = "zdharma";
          repo = "fast-syntax-highlighting";
          rev = "v1.55";
          sha256 = "0h7f27gz586xxw7cc0wyiv3bx0x3qih2wwh05ad85bh2h834ar8d";
        };
      }

      {
        name = "powerlevel10k";
        src = pkgs.zsh-powerlevel10k;
        file = "share/zsh-powerlevel10k/powerlevel10k.zsh-theme";
      }

      {
        name = "powerlevel10k-config";
        src = lib.cleanSource ./p10k-config;
        file = "p10k.zsh";
      }
    ];
  };
}
