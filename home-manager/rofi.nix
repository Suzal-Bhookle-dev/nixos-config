{
  config,
  pkgs,
  ...
}: {
  home.packages = with pkgs; [
    rofi-power-menu
    rofi-bluetooth
    rofi-screenshot
  ];
  programs.rofi = {
    enable = true;
    plugins = with pkgs; [
      rofi-calc
    ];
    extraConfig = {
      modes = "ssh,window,drun,run,combi,calc,power-menu:${pkgs.rofi-power-menu}/bin/rofi-power-menu";
      modi = "drun";
      show-icons = true;
      icon-theme = "Papirus-Dark";
      display-drun = "";
      display-window = "";
      display-power-menu = "";
      drun-display-format = "{name}";
    };
    theme = let
      inherit (config.lib.formats.rasi) mkLiteral;
    in {
      "*" = {
        bg = mkLiteral "#11121DEE";
        fg = mkLiteral "#A0A8CD";
        prompt = mkLiteral "#21222D";
        button-selected = mkLiteral "#9FBBF3";
        background-color = mkLiteral "@bg";
        text-color = mkLiteral "@fg";
        border = mkLiteral "#4A5057";
      };

      "window" = {
        /*
        background-color: @bg;
        */
        border-color = mkLiteral "@border";
        border-radius = mkLiteral "0px";
        border = mkLiteral "2";
        padding = mkLiteral "12px";
        width = mkLiteral "30%";
      };

      "prompt" = {
        background-color = mkLiteral "@prompt";
        enabled = mkLiteral "true";
        padding = mkLiteral "0% 0% 0% 1%";
      };

      "entry" = {
        background-color = mkLiteral "@prompt";
        expand = mkLiteral "true";
        padding = mkLiteral "0% 0% 0% 0%";
        margin = mkLiteral "0% 0% 0% 0%";
        placeholder-color = mkLiteral "@fg";
        # placeholder = "Search";
      };

      "inputbar" = {
        children = map mkLiteral ["prompt" "entry"];
        background-color = mkLiteral "@prompt";
        border-radius = mkLiteral "0px";
        expand = mkLiteral "false";
        padding = mkLiteral "10px";
        border = mkLiteral "1px";
        border-color = mkLiteral "@border";
      };

      "listview" = {
        padding = mkLiteral "4px 0px";
        columns = mkLiteral "1";
        lines = mkLiteral "8";
        fixed-columns = mkLiteral "true";
        cycle = mkLiteral "false";
        margin = mkLiteral "1.5% 0% 0% 0%";
        layout = mkLiteral "vertical";
        scrollbar = mkLiteral "true";
      };

      "scrollbar" = {
        width = mkLiteral "30px";
        handle-width = mkLiteral "8px";
        handle-color = mkLiteral "@button-selected";
        padding = mkLiteral "0px 0px 0px 0px";
      };

      "mainbox" = {
        children = map mkLiteral ["inputbar" "listview"];
        padding = mkLiteral "0% 0% 0% 0%";
        spacing = mkLiteral "0%";
      };

      "element" = {
        # orientation = mkLiteral "vertical";
        orientation = mkLiteral "horizontal";
        padding = mkLiteral "4px 0px";
      };

      "element-icon" = {
        horizontal-align = mkLiteral "0.5";
        size = mkLiteral "30px";
      };

      "element-text" = {
        expand = mkLiteral "true";
        # horizontal-align = mkLiteral "0.5";
        vertical-align = mkLiteral "0.5";
      };

      "element-text, element-icon" = {
        background-color = mkLiteral "inherit";
        text-color = mkLiteral "inherit";
      };

      "element selected" = {
        background-color = mkLiteral "@button-selected";
        # border-radius = mkLiteral "5px";
        border-radius = mkLiteral "0px";
        text-color = mkLiteral "@bg";
      };
    };
  };
}
