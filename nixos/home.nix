{
  config,
  pkgs,
  ...
}: {
  imports = [
    ../home-manager/i3.nix
    ../home-manager/polybar.nix
    ../home-manager/neovim.nix
    ../home-manager/tmux.nix
    ../home-manager/kitty.nix
    ../home-manager/home-stylix.nix
    ../home-manager/fish.nix
    # ../home-manager/eww.nix
    ../home-manager/hyprland.nix
    ../home-manager/rofi.nix
    ../home-manager/dunst.nix
    ../home-manager/sway.nix
  ];

  nix.settings = {
    experimental-features = ["nix-command" "flakes"];
    warn-dirty = false;
  };

  home = {
    sessionVariables = {
      QT_XCB_GL_INTEGRATION = "none"; # kde-connect
      NIXPKGS_ALLOW_UNFREE = "1";
      NIXPKGS_ALLOW_INSECURE = "1";
      BAT_THEME = "base16";
      GOPATH = "${config.home.homeDirectory}/.local/share/go";
      GOMODCACHE = "${config.home.homeDirectory}/.cache/go/pkg/mod";
    };

    sessionPath = [
      "$HOME/.local/bin"
    ];
  };

  gtk.gtk3.bookmarks = let
    home = config.home.homeDirectory;
  in [
    "file://${home}/Documents"
    "file://${home}/Music"
    "file://${home}/Pictures"
    "file://${home}/Videos"
    "file://${home}/Downloads"
    "file://${home}/Desktop"
    "file://${home}/Projects"
    "file://${home}/Vault"
    "file://${home}/.config Config"
  ];

  programs.home-manager.enable = true;
  home.stateVersion = "21.11";
}
