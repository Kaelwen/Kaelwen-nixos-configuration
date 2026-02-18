{ pkgs, ... }:
{
  imports = [
    # ./zathura.nix
    ./obs-studio.nix
    ./btop.nix
    ./opencode.nix
    ./fileChoose
    ./video
  ];
  home.packages = with pkgs; [
    postman
    filezilla
    localsend
    libreoffice-fresh
    kdePackages.kdenlive
    # wpsoffice-cn
    gimp3-with-plugins
    evince
    gthumb
    obsidian
  ];
}
