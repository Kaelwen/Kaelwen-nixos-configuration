{ pkgs, config, ... }:
{
  home.packages = with pkgs; [
    # waybar
    hyprpicker
    grim
    slurp
    swappy
    wf-recorder
    cava
    blueberry
    wlogout
    nmgui
    pavucontrol
    brightnessctl
  ];
  programs.waybar = {
    enable = true;
    systemd.enable = true;
    settings = {
      mainBar = {
        layer = "top";
        position = "top";
        orientation = "horizontal";
        margin = "2 0 2 0";
        fixed-center = true;
        modules-left = [ "niri/workspaces" ];
        modules-center = [ "clock" ];
        modules-right = [
          "tray"
          # "battery"
          "group/power"
          "pulseaudio"
          "backlight"
        ];
        "group/power" = {
          "orientation" = "inherit";
          "drawer" = {
            "transition-left-to-right" = false;
          };
          "modules" = [
            "battery"
            "power-profiles-daemon"
          ];
        };
        "battery" = {
          "interval" = 5;
          "states" = {
            "warning" = 30;
            "critical" = 10;
          };
          "format" = "{icon} {capacity:2}%";
          "format-charging" = " {capacity:2}%";
          "format-plugged" = " {capacity:2}%";
          "format-alt" = "{icon} {capacity:2}%";
          "format-icons" = [
            ""
            ""
            ""
            ""
            ""
          ];
          "tooltip" = true;
        };
        "power-profiles-daemon" = {
          "format" = "{icon}";
          "tooltip-format" = "Power profile: {profile}\nDriver: {driver}";
          "tooltip" = true;
          "format-icons" = {
            "default" = "";
            "performance" = "";
            "balanced" = "";
            "power-saver" = "";
          };
        };
        "niri/workspaces" = {
          "all-outputs" = true;
          "expand" = false;
          "format" = "{icon}";
          "format-icons" = {
            "default" = "";
            "Browser" = "󰆋";
            "Chat" = "";
            "Code" = "";
            "Game" = "󰺵";
            "Work" = "";
          };
          "tooltip" = true;
        };
        "tray" = {
          "icon-size" = 16;
          "spacing" = 12;
        };

        "idle_inhibitor" = {
          "format" = "{icon}";
          "format-icons" = {
            "activated" = "";
            "deactivated" = "";
          };
          "tooltip-format-activated" = "idle Disabled";
          "tooltip-format-deactivated" = "idle Enabled";
        };
        "network" = {
          "format-disconnected" = "{icon}";
          "format-wifi" = "{icon}";
          "format-ethernet" = "{icon} Ethernet";
          "format-icons" = {
            "disconnected" = "󰤮";
            "wifi" = [
              "󰤯"
              "󰤟"
              "󰤢"
              "󰤥"
              "󰤨"
            ];
            "ethernet" = "󰈀";
          };
          "tooltip-format-wifi" = "{essid} ({signalStrength}%)\n{ifname} : {ipaddr}";
          "tooltip-format-ethernet" = "{ifname} : {ipaddr} | Click to Open GUI";
          "tooltip-format-disconnected" = "Disconnected | Click to open GUI";
          "on-click" = "nmgui";
          "on-click-right" = "nm-connection-editor";
        };
        "bluetooth" = {
          "format-disabled" = "󰂲";
          "tooltip-format-disabled" = "Click to enable";
          "format" = "󰂯";
          "tooltip-format-on" = " 󰂯 Click to disable or Right click to open GUI";
          "format-connected" = "󰂱";
          "tooltip-format-connected" = "󰂱 {device_alias}Richt click to open GUI";
          "on-click" = "blueberry";
        };
        "backlight" = {
          "scroll-step" = 5;
          "format" = "{icon} {percent:2}%";
          "format-icons" = [
            "󰛩"
            "󱩎"
            "󱩏"
            "󱩐"
            "󱩑"
            "󱩒"
            "󱩓"
            "󱩔"
            "󱩕"
            "󱩖"
            "󰛨"
          ];
          "min-length" = 3;
          "on-click" = "brightnessctl set 1%+";
          "on-click-right" = "brightnessctl set 1%-";
        };
        "pulseaudio" = {
          "format" = "{icon} {volume}%";
          "format-icons" = {
            "headphone" = "";
            "bluetooth" = "";
            "speaker" = [
              ""
              ""
              ""
            ];
          };
          "on-click" = "pavucontrol";
          "on-scroll-up" = "wpctl set-volume @DEFAULT_AUDIO_SINK@ 0.05+";
          "on-scroll-down" = "wpctl set-volume @DEFAULT_AUDIO_SINK@ 0.05-";
        };
        "clock" = {
          "interval" = 5;
          "format" = " {:%H:%M}";
          "tooltip" = true;
          "tooltip-format" = " {:%Y-%m-%d}";
        };

      };
    };
    style = ''
      * {
        font-family: "Maple Mono NF CN", monospace;
        font-size: 14px;
        border-radius: 0;
        opacity: 1;
        border: none;
      }
      window#waybar {
        background: transparent;
        color: #${config.lib.stylix.colors.base05};
      }
      tooltip {
        background: #${config.lib.stylix.colors.base02};
        border: 0.17em solid #${config.lib.stylix.colors.base07};
        border-radius: 0.17em;
        opacity: 0.8;
      }
      tooltip label {
        color: #${config.lib.stylix.colors.base05};
        font-size: 0.89em;
      }
      #workspaces button {
        padding: 0px 0.56em;
        border-radius: 0.8em;
        transition: all 0.3s ease;
                border: none;
        color: #${config.lib.stylix.colors.base06};
                
      }
      #workspaces button:hover {
        background: #${config.lib.stylix.colors.base0E};
      }
      #workspaces button.active {
        color: #${config.lib.stylix.colors.base02};
                    border: 0.17em solid #${config.lib.stylix.colors.base0D};
        padding: 0px 1.5em;
      }

      #power,
      #tray,
      #workspaces,
      #memory,
      #cpu,
      #clock,
      #network,
      #bluetooth,
      #pulseaudio,
      #backlight,
      #idle_inhibitor
      {
        padding: 0px 0.7em;
        margin:  0px 0.5em;
        border-radius: 0.9em;
        background: #${config.lib.stylix.colors.base02};
      }

      #battery {
        color: #${config.lib.stylix.colors.base0B};
      }
      #power-profiles-daemon {
        padding: 0px 0.5em;
      }

      #pulseaudio {color: #${config.lib.stylix.colors.base0A}}
      #backlight {color: #${config.lib.stylix.colors.base09}}


      #network {color: #${config.lib.stylix.colors.base0C};}
      #bluetooth {color: #${config.lib.stylix.colors.base0D};}
    '';
  };

  # xdg.configFile = {
  #   "waybar/config.jsonc".source = ./dotfiles/config.jsonc;
  #   "waybar/modules.jsonc".source = ./dotfiles/modules.jsonc;
  #   "waybar/modules-dividers.jsonc".source = ./dotfiles/modules-dividers.jsonc;
  #   "waybar/scripts".source = ./dotfiles/scripts;
  # };
  # home.file = {
  #   ".config/waybar/style.css".text = ''
  #     * {
  #     	font-family: "Maple Mono NF CN", monospace;
  #     	font-size: 14px;
  #     	border-radius: 0;
  #     	opacity: 1;
  #     	border: none;
  #     }
  #     window#waybar {
  #     	background: transparent;
  #     	color: @on_surface;
  #     }
  #     tooltip {
  #     	background: #${config.lib.stylix.colors.base02};
  #     	border: 0.17em solid #${config.lib.stylix.colors.base07};
  #     	opacity: 0.9;
  #     }
  #     tooltip label {
  #     	color: #${config.lib.stylix.colors.base05};
  #     	font-size: 0.89em;
  #     }
  #     #workspaces button {
  #     	padding: 0px 0.56em;
  #     	background: #${config.lib.stylix.colors.base03};
  #     	color: #${config.lib.stylix.colors.base06};
  #     }
  #     #workspaces button:hover {
  #     	background: #${config.lib.stylix.colors.base03};
  #     }
  #     #workspaces button.active {
  #     	color: #${config.lib.stylix.colors.base07};
  #     }
  #     #custom-right_div.5 {
  #     	background-color: #${config.lib.stylix.colors.base02};
  #     	color: #${config.lib.stylix.colors.base03};
  #     	padding: 0px 0px;
  #     	font-size: 1.39em;
  #     }
  #     #custom-right_div.6 {
  #     	background-color: #${config.lib.stylix.colors.base00};
  #     	color: #${config.lib.stylix.colors.base02};
  #     	padding: 0px 0px;
  #     	font-size: 1.39em;
  #     }

  #     #custom-right_div.7 {
  #     	color: #${config.lib.stylix.colors.base00};
  #     	padding: 0px 0px;
  #     	font-size: 1.39em;
  #     }
  #     #power-profiles-daemon,
  #     #battery,
  #     #memory,
  #     #cpu,
  #     #clock,
  #     #network,
  #     #bluetooth,
  #     #idle_inhibitor,
  #     #custom-screenshot,
  #     #custom-wfrec,
  #     #custom-colorpicker
  #     {
  #     	padding: 0px 0.7em;
  #     }

  #     #custom-left_div.4 {
  #     	color: #${config.lib.stylix.colors.base00};
  #     	padding: 0px;
  #     	font-size: 1.39em;
  #     }
  #     #custom-right_div.4 {
  #     	color: #${config.lib.stylix.colors.base00};
  #     	padding: 0px;
  #     	font-size: 1.39em;
  #     }

  #     #power-profiles-daemon,
  #     #battery,
  #     #idle_inhibitor,
  #     #custom-screenshot,
  #     #custom-wfrec,
  #     #custom-colorpicker {
  #     	background-color: #${config.lib.stylix.colors.base00};
  #     }
  #     #custom-left_div.3 {
  #     	background-color: #${config.lib.stylix.colors.base00};
  #     	color: #${config.lib.stylix.colors.base03};
  #     	padding: 0px 0px;
  #     	font-size: 1.39em;
  #     }

  #     #custom-right_div.3 {
  #     	background-color: #${config.lib.stylix.colors.base00};
  #     	color: #${config.lib.stylix.colors.base03};
  #     	padding: 0px 0px;
  #     	font-size: 1.39em;
  #     }
  #     #cpu,
  #     #memory {
  #     	background-color: #${config.lib.stylix.colors.base03};
  #     	color: #${config.lib.stylix.colors.base07};
  #     }

  #     #bluetooth,
  #     #network {
  #     	background-color: #${config.lib.stylix.colors.base03};
  #     	color: #${config.lib.stylix.colors.base06};
  #     }

  #     #custom-left_div.2 {
  #     	background-color: #${config.lib.stylix.colors.base03};
  #     	color: #${config.lib.stylix.colors.base06};
  #     	padding: 0px 0px;
  #     	font-size: 1.39em;
  #     }

  #     #custom-right_div.2 {
  #     	background-color: #${config.lib.stylix.colors.base03};
  #     	color: #${config.lib.stylix.colors.base07};
  #     	padding: 0px 0px;
  #     	font-size: 1.39em;
  #     }
  #     #clock {
  #     	background-color: #${config.lib.stylix.colors.base07};
  #     	color: #${config.lib.stylix.colors.base03};
  #     }
  #     #clock.date {
  #     	background-color: #${config.lib.stylix.colors.base06};
  #     	color: #${config.lib.stylix.colors.base02};
  #     }
  #     #custom-left_div.1 {
  #     	background-color: #${config.lib.stylix.colors.base06};
  #     	color: #${config.lib.stylix.colors.base02};
  #     	padding: 0px 0px;
  #     	font-size: 1.39em;
  #     }
  #     #custom-right_div.1 {
  #     	background-color: #${config.lib.stylix.colors.base07};
  #     	color: #${config.lib.stylix.colors.base02};
  #     	padding: 0px 0px;
  #     	font-size: 1.39em;
  #     }
  #     #custom-left_div.5 {
  #     	background-color: #${config.lib.stylix.colors.base02};
  #     	color: #${config.lib.stylix.colors.base03};
  #     	padding: 0px 0px;
  #     	font-size: 1.39em;
  #     }
  #     #backlight {
  #     	background-color: #${config.lib.stylix.colors.base03};
  #     }
  #     #custom-left_div.6 {
  #     	background-color: #${config.lib.stylix.colors.base00};
  #     	color: #${config.lib.stylix.colors.base02};
  #     	padding: 0px 0px;
  #     	font-size: 1.39em;
  #     }
  #     #pulseaudio {
  #     	padding: 0px 0px 0px 0.28em;
  #     }
  #     #pulseaudio-slider {
  #     	padding: 0px 0px 0px 0.56em;
  #     	margin: 0px;
  #     }
  #     #pulseaudio-slider,
  #     #pulseaudio {
  #     	background-color: #${config.lib.stylix.colors.base02};
  #     	color: #${config.lib.stylix.colors.base07};
  #     }
  #     #pulseaudio-slider slider {
  #     	min-height: 0px;
  #     	min-width: 0px;
  #     	opacity: 0;
  #     	background-image: none;
  #     	box-shadow: none;
  #     	background: none;
  #     }
  #     #pulseaudio-slider trough {
  #     	min-height: 0.56em;
  #     	min-width: 4.44em;
  #     	border-radius: 0.28em;
  #     	background-color:#${config.lib.stylix.colors.base02};
  #     }

  #     #pulseaudio-slider highlight {
  #     	min-width: 0px;
  #     	border-radius: 0.28em;
  #     	background-color: #${config.lib.stylix.colors.base07};
  #     }
  #     #custom-left_div.7 {
  #     	color: #${config.lib.stylix.colors.base00};
  #     	padding: 0px 0px;
  #     	font-size: 1.39em;
  #     }
  #     #tray {
  #     	background-color: #${config.lib.stylix.colors.base00};
  #     }
  #   '';

  # };
}
