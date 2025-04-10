{ config, pkgs, ... }:

{
  programs.tmux = {
    enable = true;
    prefix = "C-space";
    baseIndex = 1;
    newSession = true;
    terminal = "xterm-256color";
    plugins = with pkgs.tmuxPlugins; [
      catppuccin
      tmux-fzf
      vim-tmux-navigator
    ];
    extraConfig = ''
      set -sg escape-time 1
      set -g status-bg '#11121d'
      set -g status-fg '#2b2f37'
      set -g status-right "#[fg=#2b2f37]#[fg=#f6955b,bg=#2b2f37]#[fg=#2b2f37]#[fg=#ee6d85,bg=#2b2f37] #S ⧉ "
    '';
  };
}



