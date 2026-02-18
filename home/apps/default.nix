{ pkgs, ... }:
{
  imports = [
    ./mc.nix
    ./chat.nix
    ./music.nix
    ./lutris.nix
    ./bottles.nix

    ./obsidian.nix
    ./obs-studio.nix
    ./video
    ./fileChoose
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
