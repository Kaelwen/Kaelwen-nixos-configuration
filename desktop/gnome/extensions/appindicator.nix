{ pkgs, ... }:
{
  home.packages = [
    pkgs.gnomeExtensions.appindicator
  ];
  dconf.settings = {
    "org/gnome/shell" = {
      enabled-extensions = [
        "appindicatorsupport@rgcjonas.gmail.com"
      ];
    };
  };
}
