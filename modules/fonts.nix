{ config, pkgs, ... }:

{
  fonts.packages = with pkgs; [
    cascadia-code
    font-awesome
    powerline-fonts
    powerline-symbols
    nerd-fonts.jetbrains-mono
    nerd-fonts.caskaydia-mono
  ];
}
