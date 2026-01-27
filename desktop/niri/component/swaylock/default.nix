{ lib, pkgs, ... }:
{

  programs.swaylock = {
    enable = true;
    package = pkgs.swaylock-effects;

  };
  xdg.configFile."swaylock/config".text = ''
    screenshots
    clock
    indicator
    indicator-radius=200
    indicator-thickness=15
    effect-blur=10x5
    font=Maple Mono NF CN
  '';

  programs.niri.settings.binds = {
    "Mod+Alt+L" = {
      hotkey-overlay.title = "锁屏";
      repeat = false;
      action.spawn = [
        (lib.getExe pkgs.swaylock-effects)
      ];
    };
  };
}
