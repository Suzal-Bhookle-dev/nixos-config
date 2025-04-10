{
  config,
  lib,
  pkgs,
  ...
}: {
  services.polybar = {
    enable = true;
    script = ''
      polybar --reload main &
    '';
    settings = {
      "colors" = {
        black = "#06080A";
        bg0 = "#11121D";
        bg1 = "#1A1B2A";
        bg2 = "#212234";
        bg3 = "#353945";
        bg4 = "#4A5057";
        bg5 = "#282C34";
        bg_red = "#FE6D85";
        bg_green = "#98C379";
        bg_blue = "#9FBBF3";
        diff_red = "#773440";
        diff_green = "#587738";
        diff_blue = "#2A3A5A";
        diff_add = "#1E2326";
        diff_change = "#262B3D";
        diff_delete = "#281B27";
        diff_text = "#1C4474";
        fg = "#A0A8CD";
        red = "#EE6D85";
        orange = "#F6955B";
        yellow = "#D7A65F";
        green = "#95C561";
        blue = "#7199EE";
        cyan = "#38A89D";
        purple = "#A485DD";
        grey = "#4A5057";
        none = "NONE";
      };

      "bar/main" = {
        width = "100%";
        height = "20pt";
        background = "\${colors.bg0}";
        foreground = "\${colors.fg}";
        line-size = "3pt";
        bottom = "true";
        border-size = "0pt";
        padding-left = "0";
        padding-right = "1";
        module-margin = "1";

        separator = "|";
        separator-foregrount = "\${colors.grey}";

        font-0 = "monospace;2";

        modules-left = "xworkspaces xwindow";
        modules-right = "memory cpu wlan date";

        cursor-clik = "pointer";
        cursor-scroll = "ns-resize";
        enable-ipc = "true";
        wm-restack = "i3";
      };

      "module/systray" = {
        type = "internal/tray";
        format-margin = "8pt";
        tray-spacing = "16pt";
      };

      "module/xworkspaces" = {
        type = "internal/xworkspaces";
        label-active = "%name%";
        # label-active-background = "\${colors.bg1}";
        label-active-background = "\${colors.bg_blue}";
        label-active-foreground = "\${colors.bg0}";
        # label-active-underline = "\${colors.orange}";
        label-active-padding = "1";

        label-occupied = "%name%";
        label-occupied-padding = "1";

        label-urgent = "%name%";
        label-urgent-background = "\${colors.diff_red}";
        label-urgent-padding = "1";

        label-empty = "%name%";
        label-empty-foreground = "\${colors.red}";
        label-empty-padding = "1";
      };

      "module/xwindow" = {
        type = "internal/xwindow";
        label = "%title:0:30:...%";
      };

      "module/memory" = {
        type = "internal/memory";
        interval = "2";
        # format-prefix = "\"RAM \"";
        format-prefix = "\" \"";
        format-prefix-foreground = "\${colors.orange}";
        label = "%percentage_used:2%%";
      };

      "module/cpu" = {
        type = "internal/cpu";
        interval = "2";
        # format-prefix = "\"CPU \"";
        format-prefix = "\" \"";
        format-prefix-foreground = "\${colors.orange}";
        label = "%percentage:2%%";
      };

      "module/wlan" = {
        type = "internal/network";
        interval = "5";
        format-connected = "<label-connected>";
        format-disconnected = "<label-disconnected>";
        # label-disconnected = "%{F#F6955B}%ifname%%{F#707880} disconnected";
        label-disconnected = "%{F#F6955B} %{F#707880} disconnected";
        interface-type = "wireless";
        # label-connected = "%{F#F6955B}%ifname%%{F-} %essid%";
        label-connected = "%{F#F6955B} %{F-} %essid%";
      };

      "module/date" = {
        type = "internal/date";
        interval = "1";

        date = "%I:%M %p";
        date-alt = "%d-%m-%Y %I:%M:%S %p";

        label = "%date%";
        label-foreground = "\${colors.yellow}";
      };

      "settings" = {
        screenchange-reload = "true";
        pseudo-transparency = "true";
      };
    };
  };
}
