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
  };
}
