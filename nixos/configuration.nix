{
  inputs,
  pkgs,
  lib,
  ...
}: let
  username = "suzal";
in {
  imports = [
    ./hardware-configuration.nix
    ../modules/default.nix
    ./locale.nix
    ./sound.nix
    ./stylix.nix
    ./nh.nix
  ];

  # Experimental features
  nix.settings.experimental-features = ["nix-command" "flakes"];

  hardware.firmware = with pkgs; [
    firmwareLinuxNonfree
    # realtek-firmware
  ];

  # Bootloader.
  # boot.loader.systemd-boot.enable = true;
  # boot.loader.efi.canTouchEfiVariables = true;

  boot.loader = {
    grub = {
      enable = true;
      efiSupport = true;
      device = "nodev";
      useOSProber = true;
    };

    efi.canTouchEfiVariables = true;
  };

  networking.hostName = "nixos"; # Define your hostname.

  # Enable networking
  networking.networkmanager.enable = true;

  # Enable polkit (for sway)
  security.polkit.enable = true;

  # Configure keymap in X11
  services = {
    tlp.enable = true;
    upower.enable = true;
    xserver = {
      enable = true;
      xkb = {
        layout = "us";
        variant = "";
      };
      windowManager.i3 = {
        enable = true;
        extraPackages = with pkgs; [
          autotiling
        ];
      };
    };

    # # Enable sddm
    # displayManager = {
    #   sddm = {
    #     enable = true;
    #   };
    # };

    greetd = {
      enable = true;
      settings = {
        default_session = {
          command = "${pkgs.greetd.tuigreet}/bin/tuigreet --cmd Hyprland";
          user = "greeter";
        };
      };
    };
  };

  programs = {
    # Enabling fish
    fish.enable = true;

    # For gtk themeing
    dconf.enable = true;

    # i3 lock
    i3lock = {
      enable = true;
      package = pkgs.i3lock-fancy;
    };
  };

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.${username} = {
    isNormalUser = true;
    description = "suzal";
    extraGroups = [
      "nixosvmtest"
      "networkmanager"
      "wheel"
      "audio"
      "video"
      "libvirtd"
      "docker"
    ];
    packages = [];
  };

  users.defaultUserShell = pkgs.fish;

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  home-manager = {
    backupFileExtension = "backup";
    useGlobalPkgs = true;
    useUserPackages = true;
    extraSpecialArgs = {inherit inputs;};
    sharedModules = [
    ];
    users.${username} = {
      home.username = username;
      home.homeDirectory = "/home/${username}";
      imports = [
        ./home.nix
      ];
    };
  };

  environment.systemPackages = with pkgs; [
    # # For sddm
    # libsForQt5.qt5.qtquickcontrols2
    # libsForQt5.qt5.qtgraphicaleffects

    # # Kernel debugger
    # linuxPackages_latest.kernel
    # kernelHeaders

    # caelestia-shell.packages.${config.system.x86_64-linux}.default

    # Applications
    firefox
    blueman
    vscode
    zoom-us

    # Cli
    git
    gh
    yazi
    xdg-user-dirs
    eza
    brightnessctl

    power-profiles-daemon
    upower

    # Other
    base16-schemes

    # windowManager
    # sway

    # Clipboard manager
    wl-clipboard
    # xclip
  ];

  environment.sessionVariables = {
    XDG_SESSION_TYPE = "wayland";
    NIXOS_OZONE_WL = "1";
    LANG = lib.mkForce "en_US.UTF-8";
    LC_ALL = lib.mkForce "en_US.UTF-8";
    XCOMPOSEFILE = "/usr/share/X11/locale/en_US/UTF-8/Compose";
  };

  system.stateVersion = "24.11"; # Did you read the comment?
}
