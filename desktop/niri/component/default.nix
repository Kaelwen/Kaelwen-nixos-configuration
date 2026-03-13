{ pkgs, ... }:
{
  home.packages = with pkgs; [
    libnotify
    wl-clipboard
  ];
  imports = [
    # ./mako
    ./waybar
    ./swayidle
    ./swaylock
    # ./quickshell
    # ./rofi
    # ./wofi
    ./fuzzel
    ./swayosd
    ./swaync
    ./wlsunset
    # ./noctalia
  ];
}
