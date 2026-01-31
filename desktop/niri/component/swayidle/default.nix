{
  pkgs,
  lib,
  ...
}:
let
  lock = lib.getExe pkgs.swaylock-effects;
  # lock = "noctalia-shell ipc call lockScreen lock";
  display = status: "${pkgs.niri}/bin/niri msg action power-${status}-monitors";
in

{
  services.swayidle = {
    enable = true;
    events = [
      {
        event = "lock";
        command = (display "off") + ";" + lock;
      }
      {
        event = "unlock";
        command = display "on";
      }
      {
        event = "after-resume";
        command = display "on";
      }
    ];
    timeouts = [
      {
        timeout = 560; # in seconds
        command = "${pkgs.libnotify}/bin/notify-send '1分钟后进入锁屏'";
      }
      {
        timeout = 600;
        command = (display "off") + ";" + lock;
      }
    ];
  };
}
