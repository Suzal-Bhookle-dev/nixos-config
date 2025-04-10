{
  config,
  pkgs,
  ...
}: {
  stylix = {
    enable = true;
    autoEnable = true;
    polarity = "dark";
    base16Scheme = "${pkgs.base16-schemes}/share/themes/tokyodark.yaml";

    # Icon themes
    iconTheme = {
      enable = true;
      package = pkgs.papirus-icon-theme;
      dark = "Papirus-Dark";
      light = "Papirus-Light";
    };

    # Targets
    targets = {
      rofi.enable = false;
    };

    # Terminal opacity
    opacity.terminal = 0.95;
  };
}
