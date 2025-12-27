{ lib, ... }:
{
  programs.waybar = {
    enable = true;
    systemd.enable = true;
    settings = {
      mainBar = {
        layer = "top";
        position = "top";
        orientation = "horizontal";
        spacing = 0;
        fixed-center = true;

        modules-left = [
          "niri/workspaces"
        ];
        modules-center = [
          "battery"
          "memory"
          "cpu"
          "clock"
        ];
        modules-right = [
          "tray"
          "power-profiles-daemon"
          "bluetooth"
          "network"
          "wireplumber"
          "backlight"
        ];

        backlight = {
          scroll-step = 5;
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
          min-length = 3;
          on-click = "brightnessctl set 1%+";
          on-click-right = "brightnessctl set 1%-";
        };

        battery = {
          interval = 5;
          states.warning = 30;
          states.critical = 10;
          format = "{icon} {capacity:2}%";
          format-charging = " {capacity:2}%";
          format-plugged = " {capacity:2}%";
          format-alt = "{icon} {capacity:2}%";
          format-icons = [
            ""
            ""
            ""
            ""
            ""
          ];
          tooltip = true;
        };

        clock = {
          interval = 5;
          format = " {:%H:%M}";
          tooltip = true;
          tooltip-format = " {:%Y-%m-%d}，右键清除通知";
          on-click-right = "makoctl reload";
        };

        cpu = {
          interval = 5;
          format = " {usage:2}%";
          tooltip = true;
          on-click = "kitty btop";
        };

        memory = {
          interval = 5;
          format = " {:2}%";
          tooltip = true;
          tooltip-format = "RAM: {used}G / {total}G\nSwap: {swapUsed}G / {swapTotal}G";
          on-click = "kitty btop";
        };

        network = {
          format-disconnected = "{icon}断咯";
          format-wifi = "{icon} {signalStrength:2}%";
          format-ethernet = "{icon}";
          format-icons.disconnected = "󰤮";
          format-icons.wifi = [
            "󰤯"
            "󰤟"
            "󰤢"
            "󰤥"
            "󰤨"
          ];
          format-icons.ethernet = "󰈀";
          tooltip-format-wifi = "{essid} ({signalStrength}%)\n{ifname} : {ipaddr}";
          tooltip-format-ethernet = "{ifname} : {ipaddr} | Click to Open GUI";
          tooltip-format-disconnected = "Disconnected | Click to open GUI";
          on-click = "nmgui";
          on-click-right = "nm-connection-editor";
        };

        bluetooth = {
          format-disabled = " 󰂲 ";
          tooltip-format-disabled = "Click to enable";
          format = " 󰂯 ";
          tooltip-format-on = " 󰂯 Click to disable or Right click to open GUI";
          format-connected = " 󰂱 ";
          tooltip-format-connected = "󰂱 {device_alias} Right click to open GUI";
          on-click = "blueberry";
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

        wireplumber = {
          scroll-step = 1;
          format = "{icon} {volume:2}%";
          format-muted = "";
          format-bluetooth = "󰂰";
          format-bluetooth-muted = "󰂲";
          format-icons.default = [
            ""
            ""
            ""
          ];
          on-click = "easyeffects";
          ignored-sinks = [
            "AudioRelay Virtual Sink"
            "Recorder Sink"
          ];
          tooltip-format = "{volume}%";
        };

        power-profiles-daemon = {
          format = " {icon} ";
          tooltip-format = "Power profile: {profile}\nDriver: {driver}";
          tooltip = true;
          format-icons = {
            default = "";
            performance = "";
            balanced = "";
            power-saver = "";
          };
        };

        custom.caffeine = {
          format = "";
          tooltip = true;
          tooltip-format = "左键禁用自动休眠，右键启用自动休眠";
          on-click = "systemctl stop --user swayidle.service && notify-send '自动休眠已禁用'";
          on-click-right = "systemctl start --user swayidle.service && notify-send '自动休眠已启用'";
        };
      };
    };
    style = lib.mkAfter ''
      * {
          font-family: "Maple Mono NF CN", monospace;
          font-weight: 500;
          font-size: 14px;
          text-shadow: none;
          transition: background 0.2s ease, color 0.2s ease;
      }

      window#waybar {
          background-color: alpha(@base02, 0.4);
          border-bottom: none;
          font-family: inherit;
      }

      .modules-left,
      .modules-center,
      .modules-right {
          background: transparent;
          padding: 0;
          margin: 2px 8px;
      }
      window#waybar.hidden {
          opacity: 0.2;
      }
      tooltip {
          color: @base05;
          font-size: 10px;
          border-radius: 8px;
          padding: 6px 8px;
          background-color: alpha(@base02,0.9);
      }
      #custom-lock,
      #custom-caffeine,
      #tray,
      #backlight,
      #battery,
      #cpu,
      #memory,
      #network,
      #wireplumber,
      #wlr-taskbar,
      #bluetooth,
      #power-profiles-daemon,
      #clock {
          padding: 0px 5px;
          margin: 0px 4px;
          border-radius: 16px;
          background-color: @base02;
      }
      #workspaces button{
          border-radius: 8px;
          padding: 0px 0.56em;
          color: @base05;
      }
      #workspaces button {
          background: transparent;
          transition: background 0.2s ease, color 0.2s ease;
      }

      #workspaces button:hover {
          background-color: @base03;
      }

      #workspaces button.focused {
          background-color: @base03;
          color: @base0A;
      }
      #tray {
          color: @base07;
          border-bottom: 2px solid @base07;
          border-right: 1px solid @base07;
      }
      #battery {
          color: @base0B;
          border-bottom: 2px solid @base0B;
          border-right: 1px solid @base0B;
      }
      #clock {
          color: @base05;
          border-bottom: 2px solid @base05;
          border-right: 1px solid @base05;
      }
      #cpu {
          color: @base08;
          border-bottom: 2px solid @base08;
          border-right: 1px solid @base08;
      }
      #backlight {
          color: @base09;
          border-bottom: 2px solid @base09;
          border-right: 1px solid @base09;

       }
      #memory {
          color: @base0E;
          border-bottom: 2px solid @base0E;
          border-right: 1px solid @base0E;

      }
      #wireplumber {
          color: @base0A;
          border-bottom: 2px solid @base0A;
          border-right: 1px solid @base0A;
      }
      #power-profiles-daemon.performance {
          color: @base0F;
          border-bottom: 2px solid @base0F;
          border-right: 1px solid @base0F;
      }
      #power-profiles-daemon.balanced {
          color: @base0C;
          border-bottom: 2px solid @base0C;
          border-right: 1px solid @base0C;
      }
      #power-profiles-daemon.power-saver {
          color: @base0B;
          border-bottom: 2px solid @base0B;
          border-right: 1px solid @base0B;
      }

      #bluetooth {
          color: @base0D;
          border-bottom: 2px solid @base0D;
          border-right: 1px solid @base0D;

      }
      #network {
          color: @base0C;
          border-bottom: 2px solid @base0C;
          border-right: 1px solid @base0C;
      }
      /* #workspaces {
          background-color:@surface1;
      }
      #tray{
          background-color:@surface1;
      } */
      #custom-caffeine { background-color: @base09; }


    '';
  };
}
