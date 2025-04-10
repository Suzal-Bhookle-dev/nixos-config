{
  config,
  pkgs,
  ...
}: {
  programs.fish = {
    enable = true;
    shellAliases = {
      l = "eza -lh  --icons=auto";
      ls = "eza -1 -a  --icons=auto";
      ll = "eza -lha --icons=auto --sort=name --group-directories-first";
      ld = "eza -lhD --icons=auto";
      lt = "eza --icons=auto --tree";
      vi = "nvim -n";
      tmux = "tmux -u a";
    };
    shellAbbrs = {
      "." = "cd ..";
      ".." = "cd ../..";
      ".3" = "cd ../../..";
      ".4" = "cd ../../../..";
      ".5" = "cd ../../../../..";
      mkdir = "mkdir -p";
    };
    interactiveShellInit = ''
      set -g fish_greeting
    '';

    plugins = [
      {
        name = "tide";
        src = pkgs.fishPlugins.tide.src;
      }
    ];
  };
}
