{ pkgs, ... }:
{
  home.packages = with pkgs.gnomeExtensions; [
    tophat
  ];
  dconf.settings = {
    "org/gnome/shell" = {
      enabled-extensions = [
        "tophat@fflewddur.github.io"
      ];
    };
    "org/gnome/shell/extensions/tophat" = {
      position-in-panel = "left";
      cpu-display = "numeric";
      fs-display = "numeric";
      mem-display = "numeric";
    };
  };
}
