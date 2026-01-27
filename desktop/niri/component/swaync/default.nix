{ pkgs, ... }:
{
  home.packages = with pkgs; [
    libnotify
    # swaynotificationcenter
  ];
  services.swaync = {
    enable = true;
  };
}
