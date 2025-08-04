{
  config,
  pkgs,
  ...
}: {
  imports = [./subModule/waybar.nix];

  wayland.windowManager.hyprland = {
    enable = true;
    xwayland.enable = true;

    settings = {
      monitor = ",1920x1080,auto,1";

      exec-once = "waybar";

      general = {
        gaps_in = "3";
        gaps_out = "5";
        layout = "master";
        allow_tearing = "false";
        resize_on_border = "false";
      };

      decoration = {
        rounding = "0";
        blur = {
          enabled = "true";
          size = "3";
          passes = "1";

          vibrancy = "0.1696";
        };
      };

      input = {
        kb_layout = "us";

        follow_mouse = "1";
        accel_profile = "flat";
        force_no_accel = "0";

        touchpad = {
          natural_scroll = "true";
        };
      };

      # device = {
      #   name = "kanata-1";
      #   senstivity = "0.5";
      # };

      gestures = {
        workspace_swipe = "true";
      };

      animations = {
        enabled = false;
      };

      "$mod" = "SUPER";
      "$terminal" = "kitty";
      "$fileManager" = "kitty -e yazi";
      "$menu" = "rofi -show drun";

      bind = [
        "$mod, RETURN, exec, $terminal"
        "$mod, Q, killactive"
        "$mod, F, exec, $fileManager"
        "$mod, B, exec, firefox"
        "$mod, V, togglefloating"

        # Rofi
        "$mod, SPACE, exec, $menu"
        "$mod SHIFT, X, exec, $menu -show power-menu -modi power-menu:rofi-power-menu"
        "$mod, PRINT, exec, rofi-screenshot"

        # Move focus with mod + vim motion
        "$mod, h, movefocus, l"
        "$mod, l, movefocus, r"
        "$mod, k, movefocus, u"
        "$mod, j, movefocus, d"

        # Resize window with vim motion
        "$mod CTRL, h, resizeactive, -10 0"
        "$mod CTRL, j, resizeactive, 0 10"
        "$mod CTRL, k, resizeactive, 0 -10"
        "$mod CTRL, l, resizeactive, 10 0"

        # Move window with mod + vim motion
        "$mod SHIFT, h, movewindow,l"
        "$mod SHIFT, l, movewindow,r"
        "$mod SHIFT, k, movewindow,u"
        "$mod SHIFT, j, movewindow,d"

        # Switch workspaces with mainMod + [0-9]
        "$mod, 1, workspace, 1"
        "$mod, 2, workspace, 2"
        "$mod, 3, workspace, 3"
        "$mod, 4, workspace, 4"
        "$mod, 5, workspace, 5"
        "$mod, 6, workspace, 6"
        "$mod, 7, workspace, 7"
        "$mod, 8, workspace, 8"
        "$mod, 9, workspace, 9"
        "$mod, 0, workspace, 10"

        # Move active window to a workspace with mainMod + SHIFT + [0-9]
        "$mod SHIFT, 1, movetoworkspace, 1"
        "$mod SHIFT, 2, movetoworkspace, 2"
        "$mod SHIFT, 3, movetoworkspace, 3"
        "$mod SHIFT, 4, movetoworkspace, 4"
        "$mod SHIFT, 5, movetoworkspace, 5"
        "$mod SHIFT, 6, movetoworkspace, 6"
        "$mod SHIFT, 7, movetoworkspace, 7"
        "$mod SHIFT, 8, movetoworkspace, 8"
        "$mod SHIFT, 9, movetoworkspace, 9"
        "$mod SHIFT, 0, movetoworkspace, 10"

        # Scroll through existing workspaces with mainMod + scroll
        "$mod, mouse_down, workspace, e-1"
        "$mod, mouse_up, workspace, e+1"
      ];

      bindm = [
        # mouse movements
        "$mod, mouse:272, movewindow"
        "$mod, mouse:273, resizewindow"
      ];

      bindl = [
        # Laptop multimedia keys for volume and LCD brightness
        ",XF86AudioRaiseVolume, exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%+"
        ",XF86AudioLowerVolume, exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"
        ",XF86AudioMute, exec, wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"
        ",XF86AudioMicMute, exec, wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"
        ",XF86MonBrightnessUp, exec, brightnessctl s 10%+"
        ",XF86MonBrightnessDown, exec, brightnessctl s 10%-"
      ];
    };
  };
}
