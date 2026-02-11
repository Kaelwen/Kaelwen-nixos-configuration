{ config, lib, ... }:
{
  services.swayosd = {
    enable = true;
  };
  programs.niri.settings.binds = {
    XF86AudioLowerVolume = {
      allow-when-locked = true;
      action.spawn = [
        "swayosd-client"
        "--output-volume"
        "lower"
      ];
    };
    XF86AudioRaiseVolume = {
      allow-when-locked = true;
      action.spawn = [
        "swayosd-client"
        "--output-volume"
        "raise"
      ];
    };
    XF86AudioMute = {
      allow-when-locked = true;
      action.spawn = [
        "swayosd-client"
        "--output-volume"
        "mute-toggle"
      ];
    };
    XF86MonBrightnessDown = {
      allow-when-locked = true;
      action.spawn = [
        "swayosd-client"
        "--brightness"
        "lower"
      ];
    };
    XF86MonBrightnessUp = {
      allow-when-locked = true;
      action.spawn = [
        "swayosd-client"
        "--brightness"
        "raise"
      ];
    };
  };
  programs.waybar.settings = {
    mainBar = {
      pulseaudio = {
        on-scroll-up = "swayosd-client --output-volume +1";
        on-scroll-down = "swayosd-client --output-volume -1";
      };
      backlight = {
        on-scroll-up = "swayosd-client --brightness +1";
        on-scroll-down = "swayosd-client --brightness -1";
      };
    };
  };
}
