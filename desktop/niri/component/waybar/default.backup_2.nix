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

        margin = "2 4 2 4";
        modules-left = [
          # "custom/wlogout"
          "niri/workspaces"
          "cpu"
          "memory"
          "temperature"
          "mpd"
        ];
        modules-center = [
          "power-profiles-daemon"
          "clock"
          "idle_inhibitor"
        ];
        modules-right = [
          # "custom/apps"
          "tray"
          "battery"
          "network"
          "bluetooth"
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
          format-disabled = "{icon} 开门!";
          format-disconnected = "{icon} {Disconnected}";
          format-wifi = "{icon} {essid}";
          format-ethernet = "{icon} {ifname}";
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
          on-click = "${pkgs.blueberry}/bin/blueberry";
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
        mpd = {
          format = "{stateIcon} {consumeIcon}{randomIcon}{repeatIcon}{singleIcon}{artist} - {album} - {title} ({elapsedTime:%M:%S}/{totalTime:%M:%S}) ⸨{songPosition}|{queueLength}⸩ {volume}% ";
          format-disconnected = "Disconnected ";
          format-stopped = "{consumeIcon}{randomIcon}{repeatIcon}{singleIcon}Stopped ";
          unknown-tag = "N/A";
          interval = 5;
          consume-icons = {
            on = " ";
          };
          random-icons = {
            off = "<span color=\"#f53c3c\"></span> ";
            on = " ";
          };
          repeat-icons = {
            on = " ";
          };
          single-icons = {
            on = "1 ";
          };
          state-icons = {
            paused = "";
            playing = "";
          };
          tooltip-format = "MPD (connected)";
          tooltip-format-disconnected = "MPD (disconnected)";
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
          #clock {
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
              background: alpha(#${config.lib.stylix.colors.base00},0.8);
              transition: all 0.3s ease;
              border-radius: 1em;
              margin: 0 0.25em;
              padding: 0 0.7em;
          }

          #network:hover,
          #battery:hover,
          #pulseaudio:hover,
          #backlight:hover,
          #bluetooth:hover,
          #cpu:hover,
          #memory:hover,
          #temperature:hover,
          #clock:hover,
          #tray:hover,
          #power-profiles-daemon:hover,
          #idle_inhibitor:hover,
          #custom-swaync:hover {
              background: alpha(#${config.lib.stylix.colors.base02},0.8);
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
        '';
  };

}
