{ pkgs, ... }:
{
  # home.packages = with pkgs; [
  #   libnotify
  #   wl-clipboard
  # ];
  imports = [
    # ./mako.nix
    ./waybar
    ./swayidle
    ./swaylock
    ./screenshot.nix
    ./rofi
    # ./fuzzel
    ./swayosd
    ./swaync
    # ./noctalia.nix
  ];
}
