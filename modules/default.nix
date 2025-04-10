{ config, pkgs, ... }:

{
  imports = [
    ./bluetooth.nix
    ./fonts.nix
    # ./tmux.nix
    # ./neovim.nix
    # ./hyprland.nix
    # ./i3.nix
    ./nix-ld.nix
    ./caps2esc.nix
  ];
}
