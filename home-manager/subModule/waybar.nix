{
  config,
  pkgs,
  ...
}: {
  programs.waybar = {
    enable = true;
    settings = {
      mainBar = {
        position = "bottom";
        spacing = "4";
        height = 5;
        modules-left = ["memory" "custom/separator" "cpu" "custom/separator" "sway/window"];
        modules-center = ["sway/workspaces"];
        modules-right = ["pulseaudio" "custom/separator" "network" "custom/separator" "battery" "custom/separator" "clock"];

        "sway/workspaces" = {
          disable-scroll = false;
          all-outputs = true;
          on-click = "activate";
        };

        "sway/window" = {
          format = "{title}";
          max-length = 50;
        };

        "clock" = {
          timezone = "Asia/Kolkata";
          tooltip-format = "<big>{:%Y %B}</big>\n<tt><small>{calendar}</small></tt>";
          format = "  {:%I:%M %p}";
          format-alt = "{:%d-%m-%Y}";
        };
        "battery" = {
          states = {
            warning = 30;
            critical = 15;
          };
          format = "{icon}  {capacity}%";
          format-full = "{icon} {capacity}%";
          format-charging = " {capacity}%";
          format-plugged = " {capacity}%";
          format-alt = "{icon} {time}";
          format-icons = ["" "" "" "" ""];
        };

        "network" = {
          format-wifi = "  {essid}";
          format-ethernet = " {ipaddr}/{cidr}";
          format-linked = " {ifname} (No IP)";
          format-disconnected = "⚠ Disconnected";
          format-alt = "{ifname}: {ipaddr}/{cidr}";
        };

        "pulseaudio" = {
          format = "{icon} {volume}% | {format_source}";
          format-bluetooth = "{icon} {volume}% | {format_source}";
          format-bluetooth-muted = " {icon} | {format_source}";
          format-muted = " | {format_source}";
          format-source = " {volume}%";
          format-source-muted = " ";
          format-icons = {
            headphone = " ";
            hands-free = " ";
            headset = " ";
            phone = " ";
            portable = " ";
            car = " ";
            default = [" " " " " "];
          };
          on-click = "blueman-manager";
        };
        "custom/separator" = {
          format = "|";
          interval = "once";
          tooltip = false;
        };

        "memory" = {
          format = "  {percentage}%";
          interval = 5;
        };

        "cpu" = {
          format = "  {usage}%";
          interval = 5;
        };
      };
    };
    style = ''
      * {
        padding: 0px;
        margin: 0px;
        font-family: "JetBrainsMono Nerd Font", "Font Awesome 6 Free Solid", "Font Awesome 6 Free Regular", "Font Awesome 6 Brands Regular";
      }

      #workspaces button {
        padding: 0px 5px;
      }
    '';
  };
}
