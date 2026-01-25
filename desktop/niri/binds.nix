{ config, ... }:
{
  programs.niri.settings = {
    binds =

      let
        mod = "Mod";
        # set-volume = spawn "wpctl" "set-volume" "@DEFAULT_AUDIO_SINK@";
        # brillo = spawn "${pkgs.brillo}/bin/brillo" "-q" "-u" "300000";
        # playerctl = spawn "${pkgs.playerctl}/bin/playerctl";
      in
      {
        "${mod}+D" = {
          hotkey-overlay.title = "打开搜索";
          repeat = false;
          action.spawn = [ "~/.config/rofi/scripts/launcher.sh" ];
        };
        "${mod}+T" = {
          action.spawn = [ "kitty" ];
        };
        "${mod}+E" = {
          action.spawn = [
            "kitty"
            "yazi"
          ];
        };
      };
  };
}
