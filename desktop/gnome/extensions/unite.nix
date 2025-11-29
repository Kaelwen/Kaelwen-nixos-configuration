{ pkgs, ... }:
{
  home.packages = [
    pkgs.gnomeExtensions.unite
  ];
  dconf.settings = {
    "org/gnome/shell" = {
      enabled-extensions = [ "unite@hardpixel.eu" ];
    };
    "org/gnome/shell/extensions/unite" = {
      autofocus-windows = false;
      enable-titlebar-actions = true;
      extend-left-box = false;
      greyscale-tray-icons = false;
      hide-app-menu-icon = false;
      hide-dropdown-arrows = true;
      hide-window-titlebars = "never";
      notifications-position = "center";
      reduce-panel-spacing = true;
      show-window-buttons = "never";
      show-desktop-name = true;
      use-activities-text = false;
      restrict-to-primary-screen = false;

    };
  };
}
