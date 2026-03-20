{
  pkgs,
  config,
  lib,
  ...
}:
let
  tty = config.programs.terminal.tty;
in
{
  imports = [ ./pavucontrol.nix ];
  programs.waybar = {
    enable = true;
    systemd = {
      target = config.wayland.systemd.target;
      enable = true;
    };
    settings = {
      mainBar = {
        layer = "top";
        position = "top";
        orientation = "horizontal";
        fixed-center = true;

        # margin = "2 4 2 4";
        modules-left = [
          "niri/workspaces"
          "cpu"
          "memory"
          # "temperature"
          "custom/div_left"
        ];
        modules-center = [
          "custom/div_right"
          "network"
          "bluetooth"
          "clock"
          "power-profiles-daemon"
          "idle_inhibitor"
          "custom/div_left"
        ];
        modules-right = [
          # "custom/apps"
          "custom/div_right"
          "tray"
          "battery"
          "pulseaudio"
          "backlight"
          "custom/swaync"
        ];
        battery = {
          interval = 5;
          states = {
            warning = 30;
            critical = 10;
          };
          format = "{icon} {capacity:2}%";
          format-charging = " {capacity:2}%";
          format-plugged = " {capacity:2}%";
          format-alt = "{icon}";
          format-icons = [
            ""
            ""
            ""
            ""
            ""
          ];
          tooltip = false;
        };

        power-profiles-daemon = {
          format = "{icon}";
          tooltip-format = "Power profile: {profile}\nDriver: {driver}";
          tooltip = true;
          format-icons = {
            default = "";
            performance = "";
            balanced = "";
            power-saver = "";
          };
        };
        "niri/workspaces" = {
          all-outputs = true;
          expand = false;
          format = "{icon}";
          format-icons = {
            default = "";
            Browser = "󰆋";
            Chat = "";
            Code = "";
            Game = "󰺵";
            Work = "";
          };
          tooltip = true;
        };
        tray = {
          icon-size = 14;
          spacing = 12;
        };

        idle_inhibitor = {
          format = "{icon}";
          format-icons = {
            activated = "";
            deactivated = "";
          };
          tooltip-format-activated = "idle Disabled";
          tooltip-format-deactivated = "idle Enabled";
        };
        network = {
          format-disabled = "{icon}";
          format-disconnected = "{icon}";
          format-wifi = "{icon}";
          format-ethernet = "{icon}";
          format-icons = {
            disconnected = "󰤮";
            disabled = "󰤮";
            wifi = [
              "󰤯"
              "󰤟"
              "󰤢"
              "󰤥"
              "󰤨"
            ];
            ethernet = "󰈀";
          };
          on-click = lib.getExe pkgs.nmgui;
        };

        bluetooth = {
          format-disabled = "󰂲";
          format = "󰂯";
          format-connected = "󰂱";
          on-click = "${tty} -e ${lib.getExe pkgs.bluetui}";
        };

        backlight = {
          scroll-step = 5;
          tooltip = false;
          format = "{icon} {percent:2}%";
          format-icons = [
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
          on-scroll-up = lib.mkDefault "${pkgs.brightnessctl}/bin/brightnessctl set 5%+";
          on-scroll-down = lib.mkDefault "${pkgs.brightnessctl}/bin/brightnessctl set 5%-";
        };
        pulseaudio = {
          format = "{icon} {volume:2}%";
          format-muted = " ";
          format-bluetooth = "";
          tooltip = false;
          format-icons = {
            headphone = "";
            bluetooth = "";
            speaker = [
              ""
              ""
              ""
            ];
          };
          on-click = "${lib.getExe pkgs.pavucontrol} -t 3";
          on-scroll-up = lib.mkDefault "wpctl set-volume @DEFAULT_AUDIO_SINK@ 0.05+";
          on-scroll-down = lib.mkDefault "wpctl set-volume @DEFAULT_AUDIO_SINK@ 0.05-";
        };

        clock = {
          interval = 60;
          format = " {:%H:%M}";
          tooltip = true;
          tooltip-format = " {:%Y-%m-%d}";
        };

        cpu = {
          interval = 3;
          format = " {usage:2}%";
          tooltip = true;
          on-click = "${tty} -e btop";
        };

        memory = {
          interval = 3;
          format = " {:2}%";
          tooltip = true;
          tooltip-format = "RAM: {used}G / {total}G\nSwap: {swapUsed}G / {swapTotal}G";
          on-click = "${tty} -e btop";
        };
        temperature = {
          interval = 5;
          format = "󰈸 {temperatureC}°C";
          # exec = "cat /sys/class/thermal/thermal_zone5/temp | awk '{print int($1/1000)}'";
        };

        "custom/swaync" = {
          format = "󱄅";
          tooltip = false;
          on-click = "${pkgs.swaynotificationcenter}/bin/swaync-client -t";
        };
        "custom/div_left" = {
          format = "";
          tooltip = false;
        };
        "custom/div_right" = {
          format = "";
          tooltip = false;
        };
      };
    };
    style =
      lib.mkForce
        #css
        ''
          * {
            font-family: "${config.stylix.fonts.monospace.name}", monospace;
            font-size: 14px;
          }
          window#waybar {
              background: transparent;
              color: #${config.lib.stylix.colors.base05};
              border-top: 0.5em solid #${config.lib.stylix.colors.base01};
          }

          tooltip {
            background: alpha(#${config.lib.stylix.colors.base00},0.8);
            border: 0.17em solid #${config.lib.stylix.colors.base07};
            border-radius: 0.4em;
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
            color: #${config.lib.stylix.colors.base03};
          }
          #workspaces button:hover {
            color: #${config.lib.stylix.colors.base06};
          }
          #workspaces button.active {
            color: #${config.lib.stylix.colors.base06};
          }
          #network,
          #battery,
          #pulseaudio,
          #backlight,
          #bluetooth,
          #cpu,
          #memory,
          #temperature,
          #clock,
          #tray,
          #power-profiles-daemon,
          #idle_inhibitor,
          #custom-swaync,
          #workspaces {
              padding: 0 0.7em;
              background: #${config.lib.stylix.colors.base01};
          }
          #network {color: #${config.lib.stylix.colors.base0C};}
          #battery {color: #${config.lib.stylix.colors.base0B};}
          #pulseaudio {color: #${config.lib.stylix.colors.base0A};}
          #backlight {color: #${config.lib.stylix.colors.base09};}
          #bluetooth {color: #${config.lib.stylix.colors.base0D};}
          #cpu {color: #${config.lib.stylix.colors.base0A}}
          #memory {color: #${config.lib.stylix.colors.base09}}
          #clock {color: #${config.lib.stylix.colors.base07}}
          #tray {color: #${config.lib.stylix.colors.base06};}
          #custom-swaync{color: #${config.lib.stylix.colors.base07};}
          #temperature{color: #${config.lib.stylix.colors.base08};}

          #power-profiles-daemon,
          #idle_inhibitor {
            color: #${config.lib.stylix.colors.base07};
          }
          #power-profiles-daemon.performance {
              color: #${config.lib.stylix.colors.base08};
          }
          #power-profiles-daemon.balanced {
              color: #${config.lib.stylix.colors.base0D};
          }
          #power-profiles-daemon.power-saver {
              color: #${config.lib.stylix.colors.base0B}
          }

          #custom-div_left,
          #custom-div_right {
            font-size: 1.44em;
            color: #${config.lib.stylix.colors.base01};
          }
        '';
  };

}
