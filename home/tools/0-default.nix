{ pkgs, ... }:
{
  imports = [
    ./zathura.nix
    ./obs-studio.nix
  ];
  home.packages = with pkgs; [
    libreoffice
    onlyoffice-desktopeditors

    filezilla
    localsend
    # kdePackages.kdenlive
    gimp3-with-plugins
    evince
    gthumb
    # shotcut
    flowblade
  ];
}
