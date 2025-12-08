{
  lib,
  ...
}:

{

  programs.waybar = {
    enable = true;
    systemd.enable = true;
    style = lib.mkAfter ''
      * {
          font-family: "Maple Mono NF CN", monospace;
          font-weight: 500;
          font-size: 14px;
          text-shadow: none;
          transition: background 0.2s ease, color 0.2s ease;
      }

      window#waybar {
          background-color: alpha(@base00, 0.7);
          border-bottom: none;
          font-family: inherit;
      }

      .modules-left,
      .modules-center,
      .modules-right {
          background: transparent;
          padding: 0;
          margin: 0;
      }

      window#waybar.hidden {
          opacity: 0.2;
      }

      tooltip {
          color: @base02;
          font-family: "Sarasa Gothic SC";
          font-size: 10px;
          border-radius: 8px;
          padding: 6px 8px;
          background-color: alpha(@base00, 0.9);
      }

      #custom-lock,
      #custom-poweroff,
      #custom-reboot,
      #custom-search,
      #custom-hibernate,
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
          border-radius: 4px;
          background-color: @base00;
          padding: 0px 2px;
          margin: 5px 2px;
      }
      #workspaces button{
        border-radius: 4px;
          color: @base07;
          padding: 0px 2px;
          margin: 5px 2px;
      }

      #battery { color: @base0C; }
      #clock { color: @base07; }
      #cpu { color: @base08; }
      #backlight { color: @base0A; }
      #memory { color: @base0E; }
      #wireplumber { color: @base0B; }
      #network { color: @base0C; }
      #custom-lock { background-color: @base0A; }
      #custom-poweroff { background-color: @base08; }
      #custom-reboot { background-color: @base0C; }
      #custom-hibernate { background-color: @base0B; }
      #custom-caffeine { background-color: @base09; }

      #workspaces button {
          background: transparent;
          transition: background 0.2s ease, color 0.2s ease;
      }

      #workspaces button:hover {
          background-color: alpha(@base07, 0.2);
      }

      #workspaces button.focused {
          background-color: alpha(@base07, 0.4);
          color: @base0D;
      }
    '';
  };
}
