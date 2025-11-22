{ config, ... }:
let
  # path to your nvim config directory
  wallpapersPath = "${config.home.homeDirectory}/nixos/assets/wallpapers";
  # path to your doom emacs config directory
  # waybarPath = "${config.home.homeDirectory}/nixos/desktop/niri/dotfiles/waybar/config.jsonc";
in
{
  xdg.dataFile."backgrounds".source = config.lib.file.mkOutOfStoreSymlink wallpapersPath;
  # other configurations
}
