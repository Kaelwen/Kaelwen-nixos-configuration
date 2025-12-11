{ pkgs, ... }:
{
  home.packages = [
    pkgs.gnomeExtensions.docker
  ];
}
