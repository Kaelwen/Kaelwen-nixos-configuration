{ pkgs, ... }:
{
  home.packages = [
    pkgs.gnomeExtensions.blur-my-shell
  ];
  dconf.settings = {
    "org/gnome/shell" = {
      enabled-extensions = [
        "blur-my-shell@aunetx"
      ];
    };
    "org/gnome/shell/extensions/blur-my-shell/dash-to-dock" = {
      blur = false;
    };
  };
}
