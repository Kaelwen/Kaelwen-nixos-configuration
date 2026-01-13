{ pkgs, ... }:
{
  imports = [
    # ./zathura.nix
    ./obs-studio.nix
    # ./wpsoffice/default.nix

  ];
  home.packages = with pkgs; [
    postman
    filezilla
    localsend
    # kdePackages.kdenlive
    # gimp3-with-plugins
    evince
    gthumb
    wpsoffice-cn
  ];
}
