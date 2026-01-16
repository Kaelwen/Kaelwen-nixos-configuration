{ pkgs, config, ... }:
{
  # home.packages = with pkgs; [
  #   rofi
  # ];
  xdg.configFile."rofi".source = ./dotfiles;
  programs.rofi = {
    enable = true;
    plugins = with pkgs; [
      rofi-calc
      rofimoji
      rofi-vpn
      rofi-file-browser
    ];
  };
}
