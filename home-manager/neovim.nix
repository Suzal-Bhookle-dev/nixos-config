{
  config,
  lib,
  pkgs,
  ...
}: {
  xdg = {
    configFile.nvim.source = ../nvim;
    desktopEntries."nvim" = lib.mkIf pkgs.stdenv.isLinux {
      name = "NeoVim";
      comment = "Edit text files";
      icon = "nvim";
      exec = "xterm -e ${pkgs.neovim}/bin/nvim %F";
      categories = ["TerminalEmulator"];
      terminal = false;
      mimeType = ["text/plain"];
    };
  };

  home.sessionVariables = {
    EDITOR = "nvim";
    VISUAL = "nvim";
  };

  home.packages = with pkgs; [
    # lua
    stylua
    lua-language-server

    # Python
    black
    pyright

    # nix
    nixd
    alejandra

    # Javascript
    tailwindcss-language-server
    typescript-language-server
    biome

    # html & css
    vscode-langservers-extracted

    # Prgamming languages
    nodejs_23
    python314
  ];

  programs.neovim = {
    enable = true;
    defaultEditor = true;
    viAlias = true;
    vimAlias = true;

    withRuby = true;
    withNodeJs = true;
    withPython3 = true;

    extraPackages = with pkgs; [
      git
      gcc
      gnumake
      unzip
      wget
      curl
      tree-sitter
      ripgrep
      fd
      fzf
      cargo
      lazygit

      nil
      lua-language-server
      stylua
      alejandra
    ];
  };
}
