{ config, ... }:
# let
#   niriPath = "${config.home.homeDirectory}/nixos/desktop/niri/dotfiles/niri";
# in
{
  # xdg.configFile."niri".source = config.lib.file.mkOutOfStoreSymlink niriPath;
  # xdg.configFile."waybar".source = config.lib.file.mkOutOfStoreSymlink waybarPath;
  xdg.configFile."niri".source = ./dotfiles;
}
