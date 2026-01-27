{
  pkgs,
  lib,
  ...
}:
{
  programs.niri.settings = {
    spawn-at-startup = [
      # {
      #   command = [
      #     "wl-paste"
      #     "--watch"
      #     "cliphist"
      #     "store"
      #   ];
      # }
      {
        command = [
          "bash"
          "-c"
          "echo 'Xft.dpi: 144' | xrdb -merge"
        ];
      }
      { command = [ "swww-daemon" ]; }
    ];
    prefer-no-csd = true;

    hotkey-overlay = {
      skip-at-startup = true;
      hide-not-bound = true;
    };
    xwayland-satellite = {
      enable = true;
      path = lib.getExe pkgs.xwayland-satellite;
    };
    gestures.hot-corners.enable = false;

    layout = {
      gaps = 4;
      background-color = "transparent";
      center-focused-column = "on-overflow";
      always-center-single-column = true;
      preset-column-widths = [
        { proportion = 0.5; }
        { proportion = 0.7; }
        { proportion = 1.0; }
      ];
      default-column-width = {
        proportion = 0.7;
      };
      focus-ring.enable = false;
      border.enable = false;
    };

    input = {
      focus-follows-mouse = {
        enable = true;
        max-scroll-amount = "10%";
      };
      touchpad.natural-scroll = true;
      keyboard.xkb.options = "caps:escape";
    };
  };
}
