{ pkgs, ... }:
{
  home.packages = [
    pkgs.gnomeExtensions.battery-health-charging
    # pkgs.polkit_gnome
    # pkgs.polkit
  ];
  dconf.settings = {
    "org/gnome/shell" = {
      enabled-extensions = [
        "Battery-Health-Charging@maniacx.github.com"
      ];
    };
  };
}
