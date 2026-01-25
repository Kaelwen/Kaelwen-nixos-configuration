{
  pkgs,
  lib,
  ...
}:
{
  programs.niri.settings = {
    spawn-at-startup = [
      {
        command = [
          "wl-paste"
          "--watch"
          "cliphist"
          "store"
        ];
      }
      { command = [ "${lib.getExe pkgs.xwayland-satellite}" ]; }
      {
        command = [
          "bash"
          "-c"
          "echo 'Xft.dpi: 144' | xrdb -merge"
        ];
      }
    ];
    prefer-no-csd = true;

    hotkey-overlay = {
      skip-at-startup = true;
      hide-not-bound = true;
    };
    # gestures = {
    #   hot-corners = false;
    # };
    input = {
      focus-follows-mouse = {
        enable = true;
        max-scroll-amount = "10%";
      };

    };
  };
}
