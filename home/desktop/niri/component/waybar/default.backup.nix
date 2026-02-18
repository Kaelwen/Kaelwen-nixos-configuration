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
          "custom/wlogout"
          "niri/workspaces"
          "cpu"
          "cpu#data"
          "memory"
          "memory#data"
        ];
        modules-center = [
          "power-profiles-daemon"
          "clock"
          "clock#data"
          "idle_inhibitor"
        ];
        modules-right = [
          "custom/apps"
          "tray"
          "battery"
          "battery#data"
          "network"
          "network#data"
          "bluetooth"
          "bluetooth#data"
          "pulseaudio"
          "pulseaudio#data"
          "backlight"
          "backlight#data"
        ];
        battery = {
          interval = 5;
          states = {
            warning = 30;
            critical = 10;
          };
          format = "{icon}";
          format-charging = "";
          format-plugged = "";
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
        "battery#data" = {
          format = "{capacity:2}%";
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
          icon-size = 16;
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
          format-disconnected = "{icon}";
          format-wifi = "{icon}";
          format-ethernet = "{icon}";
          format-icons = {
            disconnected = "󰤮";
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
        "network#data" = {
          on-click = lib.getExe pkgs.nmgui;
          format-wifi = "{essid}";
          format-ethernet = "{ifname}";
          format-disconnected = "{Disconnected}";
        };
        bluetooth = {
          format-disabled = "󰂲";
          format = "󰂯";
          format-connected = "󰂱";
          on-click = "${pkgs.blueberry}/bin/blueberry";
        };
        "bluetooth#data" = {
          on-click = "${pkgs.blueberry}/bin/blueberry";
          format-disabled = "off";
          format = "on";
          format-connected = "on";
        };

        backlight = {
          scroll-step = 5;
          tooltip = false;
          format = "{icon}";
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
        };
        "backlight#data" = {
          format = "{percent:2}%";
        };

        pulseaudio = {
          format = "{icon}";
          format-muted = "";
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
          on-click = lib.getExe pkgs.pavucontrol;

        };
        "pulseaudio#data" = {
          on-click = lib.getExe pkgs.pavucontrol;
          format = "{volume:2}%";
        };

        clock = {
          interval = 60;
          format = "";
          tooltip = true;
          tooltip-format = " {:%Y-%m-%d}";
        };
        "clock#data" = {
          format = "{:%H:%M}";
        };
        cpu = {
          interval = 5;
          format = "";
          tooltip = true;
          on-click = "${tty} btop";
        };
        "cpu#data" = {
          format = "{usage:2}%";
        };
        memory = {
          interval = 5;
          format = "";
          tooltip = true;
          tooltip-format = "RAM: {used}G / {total}G\nSwap: {swapUsed}G / {swapTotal}G";
          on-click = "${tty} btop";
        };
        "memory#data" = {
          format = "{:2}%";
        };
        "custom/wlogout" = {
          format = "󱄅";
          tooltip = false;
          on-click = "~/.config/rofi/scripts/powermenu.sh";
        };
        "custom/apps" = {
          format = "";
          tooltip = false;
          on-click = "~/.config/rofi/scripts/launcher.sh";
        };
      };
    };
    style =
      lib.mkForce
        #css
        ''
          * {
            font-family: "Maple Mono NF CN", monospace;
            font-size: 14px;
          }
          window#waybar {
              background: #${config.lib.stylix.colors.base01};
              /* background:transparent; */
              color: #${config.lib.stylix.colors.base05};
          }
          .modules-left,
          .modules-center,
          .modules-right {
              margin:0.3em 0;
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
            color: #${config.lib.stylix.colors.base06};

          }
          #workspaces button:hover {
            background: #${config.lib.stylix.colors.base0E};
          }
          #workspaces button.active {
            color: #${config.lib.stylix.colors.base07};
          }
          #workspaces {
            background: #${config.lib.stylix.colors.base02};
            border-radius: 0.5em;
            margin: 0 0.5em;
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
          #clock,
          #custom-apps {
              color: #${config.lib.stylix.colors.base00};
              border-radius: 0.5em 0 0 0.5em;
              margin: 0 0 0 0.25em;
              padding: 0 0.7em;
          }

          #network.data,
          #battery.data,
          #pulseaudio.data,
          #backlight.data,
          #bluetooth.data,
          #cpu.data,
          #memory.data,
          #clock.data,
          #tray {
            background: #${config.lib.stylix.colors.base02};
            border-radius: 0 0.5em 0.5em 0;
            margin: 0 0.25em 0 0;
            padding: 0 0.5em;
          }

          #network {background: #${config.lib.stylix.colors.base0C};}
          #network.data {color: #${config.lib.stylix.colors.base0C};}
          #battery {background: #${config.lib.stylix.colors.base0B};}
          #battery.data {color: #${config.lib.stylix.colors.base0B};}
          #pulseaudio {background: #${config.lib.stylix.colors.base0A};}
          #pulseaudio.data {color: #${config.lib.stylix.colors.base0A};}
          #backlight {background: #${config.lib.stylix.colors.base09};}
          #backlight.data {color: #${config.lib.stylix.colors.base09};}
          #bluetooth {background: #${config.lib.stylix.colors.base0D};}
          #bluetooth.data {color: #${config.lib.stylix.colors.base0D};}
          #cpu {background: #${config.lib.stylix.colors.base08}}
          #cpu.data {color: #${config.lib.stylix.colors.base08}}
          #memory {background: #${config.lib.stylix.colors.base0E}}
          #memory.data {color: #${config.lib.stylix.colors.base0E}}
          #clock {background: #${config.lib.stylix.colors.base07}}
          #clock.data {color: #${config.lib.stylix.colors.base07}}

          #custom-apps {background: #${config.lib.stylix.colors.base06};}
          #tray {color: #${config.lib.stylix.colors.base06};}

          #custom-wlogout {
            color: #${config.lib.stylix.colors.base00};
            background: #${config.lib.stylix.colors.base07};
            border-radius: 0.3em;
            font-size: 1.39em;
            padding: 0px 0.5em;
            margin:0 0.25em;
          }

          #power-profiles-daemon,
          #idle_inhibitor {
            margin:0.4em;
            padding: 0px 0.5em;
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
