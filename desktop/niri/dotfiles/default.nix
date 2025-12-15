{ config, ... }:
let
  # path to your nvim config directory
  # my_scriptPath = "${config.home.homeDirectory}/nixos/desktop/niri/dotfiles/my_script";
  niriPath = "${config.home.homeDirectory}/nixos/desktop/niri/dotfiles/niri";
  # waybarPath = "${config.home.homeDirectory}/nixos/desktop/niri/dotfiles/waybar/config.jsonc";
  waybarPath = "${config.home.homeDirectory}/nixos/desktop/niri/dotfiles/waybar";
in
{
  xdg.configFile."niri".source = config.lib.file.mkOutOfStoreSymlink niriPath;
  # xdg.configFile."my_script".source = config.lib.file.mkOutOfStoreSymlink my_scriptPath;
  # xdg.configFile."waybar/config.jsonc".source = config.lib.file.mkOutOfStoreSymlink waybarPath;
  xdg.configFile."waybar".source = config.lib.file.mkOutOfStoreSymlink waybarPath;

  # other configurations
}
