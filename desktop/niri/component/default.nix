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
    ./quickshell
    # ./rofi
    ./fuzzel
    ./swayosd
    ./swaync
    ./wlsunset
    # # ./noctalia
  ];
}
