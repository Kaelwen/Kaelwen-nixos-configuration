{ pkgs, ... }:
{
  home.packages = with pkgs; [
    grim
    slurp
    satty
  ];
  programs.niri.settings.binds = {
    "Ctrl+Alt+A" = {
      # hotkey-overlay.title = "将窗口移至中央";
      action.spawn = [ "${./screenshot.sh}" ];
    };
  };
}
