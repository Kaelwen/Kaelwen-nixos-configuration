{ ... }:
{
  programs.niri.settings = {
    window-rules = [
      {
        matches = [
          { app-id = "authentication-agent-1|pwvucontrol"; }
          { app-id = "com.network.manager"; }
          { app-id = "connman-gtk"; }
          { app-id = "fcitx"; }
          { app-id = "mpv"; }
          { app-id = "org.gnome.FileRoller"; }
          { app-id = "org.kde.polkit-kde-authentication-agent-1"; }
          { app-id = "org.keepassxc.KeePassXC"; }
          { app-id = "blueberry"; }
          { app-id = "copyq"; }
          { app-id = "waypaper"; }
        ];
        open-floating = true;
      }
      {
        matches = [
          { app-id = "Waydroid"; }
          { app-id = "gamescope"; }
          { app-id = "r#'^steam_app'#"; }
          { app-id = ".gamescope-wrapped"; }
        ];
        open-fullscreen = true;
      }
    ];
  };
}
