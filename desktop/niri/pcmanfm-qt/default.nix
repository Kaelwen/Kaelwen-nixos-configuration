{ pkgs, ... }:
{
  home.packages = with pkgs; [
    lxqt.pcmanfm-qt
  ];
  xdg.configFile."pcmanfm-qt/default".source = ./dotfiles;
}
