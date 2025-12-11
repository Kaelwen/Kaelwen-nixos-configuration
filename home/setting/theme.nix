{
  pkgs,
  ...
}:

{
  # qt.platformTheme.name = "qtct";

  gtk = {
    enable = true;
  };
  qt.enable = true;
  home.sessionVariables = {
    XDG_ICON_THEME = "Papirus-Dark";
  };

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
