{ pkgs, ... }:
{
  home.packages = with pkgs; [
    hexo-cli
    gcc
    go
    nodejs
    cargo
  ];
}
