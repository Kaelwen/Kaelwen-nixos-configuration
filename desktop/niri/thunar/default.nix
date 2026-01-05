{ pkgs, ... }:
{
  home.packages = with pkgs; [
    thunar
  ];
  xdg.configFile."Thunar/uca.xml".source = ./dotfiles/uca.xml;
}
