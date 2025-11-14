{ config, pkgs, ... }:
let
  # path to your nvim config directory
  niriPath = "${config.home.homeDirectory}/nixos/desktop/niri/dotfiles/niri";
  # path to your doom emacs config directory
  waybarPath = "${config.home.homeDirectory}/nixos/desktop/niri/dotfiles/waybar";
in
{
  xdg.configFile."niri".source = config.lib.file.mkOutOfStoreSymlink niriPath;
  xdg.configFile."waybar".source = config.lib.file.mkOutOfStoreSymlink waybarPath;

  # other configurations
}
