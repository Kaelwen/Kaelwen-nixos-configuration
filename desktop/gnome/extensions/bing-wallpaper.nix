{ pkgs, ... }:
{
  home.packages = [
    pkgs.gnomeExtensions.bing-wallpaper
  ];
  # dconf.settings = {
  #   "org/gnome/shell" = {
  #     enabled-extensions = [
  #       "appindicatorsupport@rgcjonas.gmail.com"
  #     ];
  #   };
  # };
}
