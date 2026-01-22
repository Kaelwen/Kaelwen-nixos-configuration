{ pkgs, ... }:
{
  imports = [
    # ./zathura.nix
    ./obs-studio.nix
    ./btop.nix
    ./opencode.nix
    ./wpsoffice/default.nix

  ];
  home.packages = with pkgs; [
    postman
    filezilla
    localsend
    # libreoffice
    kdePackages.kdenlive
    gimp3-with-plugins
    evince
    gthumb
    # wpsoffice-cn
  ];
}
