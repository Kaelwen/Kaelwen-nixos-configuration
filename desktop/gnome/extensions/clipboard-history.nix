{ pkgs, ... }:
{
  home.packages = [
    pkgs.gnomeExtensions.clipboard-history
  ];
  dconf.settings = {
    "org/gnome/shell" = {
      enabled-extensions = [
        "clipboard-history@alexsaveau.dev"
      ];
    };
  };
}
