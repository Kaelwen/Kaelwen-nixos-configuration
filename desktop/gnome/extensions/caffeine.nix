{ pkgs, ... }:
{
  home.packages = [
    pkgs.gnomeExtensions.caffeine
  ];
  dconf.settings = {
    "org/gnome/shell" = {
      enabled-extensions = [
        "caffeine@patapon.info"
      ];
    };
  };
}
