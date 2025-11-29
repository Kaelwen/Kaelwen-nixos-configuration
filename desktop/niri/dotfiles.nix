{ config, ... }:
let
  # path to your nvim config directory
  niriPath = "${config.home.homeDirectory}/nixos/desktop/niri/dotfiles/niri";
  # path to your doom emacs config directory
  # waybarPath = "${config.home.homeDirectory}/nixos/desktop/niri/dotfiles/waybar/config.jsonc";
in
{
  xdg.configFile."niri".source = config.lib.file.mkOutOfStoreSymlink niriPath;
  xdg.configFile."waybar/config.jsonc".source = ./dotfiles/waybar/config.jsonc;

  # other configurations
}
