{ pkgs, ... }:
{
  # home.packages = with pkgs; [
  #   libnotify
  #   wl-clipboard
  # ];
  imports = [
    # ./mako
    # ./waybar
    ./swayidle
    # ./swaylock
    ./screenshot.nix
    # ./rofi
    # ./fuzzel
    # ./swayosd
    # ./swaync
    ./noctalia
  ];
}
