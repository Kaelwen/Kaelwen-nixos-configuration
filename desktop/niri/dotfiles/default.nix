{ config, ... }:
let
  # path to your nvim config directory
  # my_scriptPath = "${config.home.homeDirectory}/nixos/desktop/niri/dotfiles/my_script";
  niriPath = "${config.home.homeDirectory}/nixos/desktop/niri/dotfiles/niri";
  # path to your doom emacs config directory
  # waybarPath = "${config.home.homeDirectory}/nixos/desktop/niri/dotfiles/waybar/config.jsonc";
in
{
  xdg.configFile."niri".source = config.lib.file.mkOutOfStoreSymlink niriPath;
  # xdg.configFile."my_script".source = config.lib.file.mkOutOfStoreSymlink my_scriptPath;
  xdg.configFile."waybar/config.jsonc".source = ./waybar/config.jsonc;

  # other configurations
}
