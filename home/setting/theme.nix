{
  pkgs,
  ...
}:

{
  # qt.platformTheme.name = "qtct";
  # gtk = {
  #   enable = true;
  #   colorScheme = "dark";
  #   theme = {
  #     name = "Adwaita-dark";
  #     package = pkgs.gnome-themes-extra;
  #   };
  #   iconTheme = {
  #     name = "Papirus-Dark";
  #     package = pkgs.papirus-icon-theme;
  #   };
  # };
  # home.packages = with pkgs; [
  #   adwaita-qt
  #   qt6Packages.qt6ct
  # ];
  # qt.enable = true;
  # home.sessionVariables = {
  #   XDG_ICON_THEME = "Papirus-Dark";
  # };

  home.pointerCursor = {
    enable = true;
    package = pkgs.bibata-cursors;
    name = "Bibata-Modern-Classic";
    size = 26;

    dotIcons.enable = true;
    gtk.enable = true;
    x11 = {
      enable = true;
      defaultCursor = "default";
    };
  };

  # home.packages = with pkgs; [ adwaita-icon-theme ];
}
