{ config, ... }:
{
  programs.niri.settings = {
    layer-rules = [
      {
        matches = [
          { namespace = "^swww*"; }
          { namespace = "^overlay-mask*"; }
          { namespace = "^noctalia-wallpaper*"; }
        ];
        place-within-backdrop = true;
      }
      {
        matches = [
          { namespace = "^notifications$"; }
        ];
        block-out-from = "screencast";
      }
    ];

    workspaces = {
      "1" = {
        name = "Browser";
      };
      "2" = {
        name = "Chat";
      };
      "3" = {
        name = "Code";
      };
      "4" = {
        name = "Game";
      };
      "5" = {
        name = "Work";
      };
    };
    window-rules = [
      {
        draw-border-with-background = false;
        geometry-corner-radius = {
          top-left = 8.0;
          top-right = 8.0;
          bottom-right = 8.0;
          bottom-left = 8.0;
        };
        clip-to-geometry = true;
      }
      {
        matches = [
          { app-id = "org.pulseaudio.pavucontrol"; }
          { app-id = "fcitx"; }
          { app-id = "mpv"; }
          { app-id = "org.gnome.FileRoller"; }
          { app-id = "org.kde.polkit-kde-authentication-agent-1"; }
          { app-id = "org.keepassxc.KeePassXC"; }
          { app-id = "blueberry"; }
          { app-id = "com.network.manager"; }
          { app-id = "waypaper"; }
          {
            app-id = "QQ";
            title = "图片查看器";
          }
          {
            app-id = "wechat";
            title = "图片和视频";
          }
          {
            app-id = "org.telegram.desktop";
            title = "Media^";
          }
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
      {
        matches = [
          { app-id = "firefox"; }
          { app-id = "librewolf"; }
          { app-id = "zen-twilight"; }
          { app-id = "chromium-browser"; }
          { app-id = "io.github.ungoogled_software.ungoogled_chromium"; }
        ];
        open-on-workspace = "Browser";
        open-maximized = true;
      }
      {
        matches = [
          { app-id = "thunderbird"; }
          { app-id = "wechat"; }
          { app-id = "org.telegram.desktop"; }
          { app-id = "QQ"; }
          { app-id = "com.alibabainc.dingtalk"; }
          { app-id = "wemeetapp"; }
        ];
        open-on-workspace = "Chat";
      }
      {
        matches = [
          { title = "r#'.*Lapce$'#"; }
          { app-id = "code"; }
          { app-id = "Code"; }
          { app-id = "codium"; }
          { app-id = "dev.zed.Zed"; }
          { app-id = "jetbrains-pycharm"; }
        ];
        open-on-workspace = "Code";
        open-maximized = true;
      }
      {
        matches = [
          { app-id = "heroic"; }
          { app-id = "steam"; }
          { app-id = "r#'^steam_app'#"; }
          { app-id = ".gamescope-wrapped"; }
          { app-id = "^osu"; }
          { app-id = "org.prismlauncher.PrismLauncher"; }
          { app-id = "org.jackhuang.hmcl.Launcher"; }
        ];
        open-on-workspace = "Game";
      }
      {
        matches = [
          { app-id = "wps"; }
          { app-id = "^libreoffice"; }
          { app-id = "Microsoft Windows"; }
          { app-id = "org.kde.kdenlive"; }
          { app-id = "org.inkscape.Inkscape"; }
          { app-id = "gimp"; }
          { app-id = "krita"; }
          { app-id = "resolve"; }
        ];
        open-on-workspace = "Work";
        open-maximized = true;
      }
    ];
  };
}
