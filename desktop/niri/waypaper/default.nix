{
  pkgs,
  ...
}:

{
  home.packages = with pkgs; [
    swww
    # mpvpaper
    waypaper
    socat
  ];
  # xdg.configFile."waypaper".source = ./dotfiles;
}
