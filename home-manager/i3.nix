{
  lib,
  pkgs,
  ...
}: let
  mod = "Mod4";
in {
  # enable picom
  services.picom = {
    enable = true;
    package = pkgs.picom;
    fade = true;
    fadeSteps = [0.10 0.10];
  };

  # enable i3
  xsession.windowManager.i3 = {
    enable = true;
    config = {
      modifier = mod;

      # gaps = {
      #   inner = 3;
      #   outer = 5;
      # };

      terminal = "kitty";

      window = {
        border = 2;
        titlebar = false;
      };

      startup = [
        {
          command = "systemctl --user restart polybar";
          always = true;
          notification = false;
        }
        {
          command = "i3-msg 'workspace number 1'";
        }
        {
          command = "autotiling";
          always = true;
        }
      ];

      keybindings = lib.mkOptionDefault {
        # Kill active
        "${mod}+q" = "kill";

        # Rofi
        "${mod}+space" = "exec --no-startup-id ${pkgs.rofi}/bin/rofi -show drun";
        "${mod}+Shift+x" = "exec --no-startup-id ${pkgs.rofi}/bin/rofi -show power-menu -modi power-menu:rofi-power-menu";
        "${mod}+Print" = "exec --no-startup-id rofi-screenshot";
        "${mod}+Tab" = "exec --no-startup-id ${pkgs.rofi}/bin/rofi -show window";

        # Application
        "${mod}+Return" = "exec kitty";
        "${mod}+b" = "exec firefox";

        # Focus
        "${mod}+h" = "focus left";
        "${mod}+j" = "focus down";
        "${mod}+k" = "focus up";
        "${mod}+l" = "focus right";

        # Move
        "${mod}+Shift+h" = "move left";
        "${mod}+Shift+j" = "move down";
        "${mod}+Shift+k" = "move up";
        "${mod}+Shift+l" = "move right";

        # Switch to workspace
        "${mod}+1" = "workspace number 1";
        "${mod}+2" = "workspace number 2";
        "${mod}+3" = "workspace number 3";
        "${mod}+4" = "workspace number 4";
        "${mod}+5" = "workspace number 5";
        "${mod}+6" = "workspace number 6";
        "${mod}+7" = "workspace number 7";
        "${mod}+8" = "workspace number 8";
        "${mod}+9" = "workspace number 9";

        # Move to workspace
        "${mod}+Shift+1" = "move container to workspace number 1";
        "${mod}+Shift+2" = "move container to workspace number 2";
        "${mod}+Shift+3" = "move container to workspace number 3";
        "${mod}+Shift+4" = "move container to workspace number 4";
        "${mod}+Shift+5" = "move container to workspace number 5";
        "${mod}+Shift+6" = "move container to workspace number 6";
        "${mod}+Shift+7" = "move container to workspace number 7";
        "${mod}+Shift+8" = "move container to workspace number 8";
        "${mod}+Shift+9" = "move container to workspace number 9";

        # Resize
        "${mod}+r" = "mode resize";

        # Reload
        "${mod}+Shift+c" = "reload";

        # Exit
        "${mod}+Shift+e" = "exec i3-nagbar -t warning -m 'Do you want to exit i3?' -b 'Yes' 'i3-msg exit'";

        # Restart
        "${mod}+Shift+r" = "restart";

        # Volume
        "XF86AudioRaiseVolume" = "exec --no-startup-id wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%+ && $refresh_i3status";
        "XF86AudioLowerVolume" = "exec --no-startup-id wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%- && $refresh_i3status";
        "XF86AudioMute" = "exec --no-startup-id wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle && $refresh_i3status";
        "XF86AudioMicMute" = "exec --no-startup-id wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle && $refresh_i3status";
      };

      bars = [
        # {
        #   position = "bottom";
        #   statusCommand = "${pkgs.i3blocks}/bin/i3blocks -c ~/.config/i3blocks/bottom";
        #   colors = {
        #     background = "#11121DEE";
        #     statusline = "#A0A8CD";
        #     separator = "#A0A8CD";
        #     focusedStatusline = "#282c34";
        #     focusedSeparator = "#282c34";
        #   };
        # }
      ];
    };
  };
}
