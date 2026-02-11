{ pkgs, ... }:
{
  imports = [
    # ./zathura.nix
    ./obs-studio.nix
    ./btop.nix
    ./opencode.nix
    # ./wpsoffice/default.nix

  ];
  home.packages = with pkgs; [
    postman
    filezilla
    localsend
    libreoffice
    gimp3-with-plugins
    evince
    gthumb
    mpv
    obsidian

  ];
}
