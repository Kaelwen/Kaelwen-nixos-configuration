{ pkgs, ... }:
{
  home.packages = [
    pkgs.gnomeExtensions.docker
  ];
  dconf.settings = {
    "org/gnome/shell" = {
      enabled-extensions = [
        "docker@stickman_0x00.com"
      ];
    };
  };
}
