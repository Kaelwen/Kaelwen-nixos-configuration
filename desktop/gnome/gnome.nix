{ pkgs, ... }:
{
  services.desktopManager.gnome = {
    enable = true;
  };
  services.displayManager.gdm = {
    enable = true;
  };
  services.gnome = {
    core-apps.enable = false;
    core-developer-tools.enable = false;
    games.enable = false;
  };

  services.udev.packages = [ pkgs.gnome-settings-daemon ];

  environment.systemPackages =
    with pkgs;
    [
      nautilus # 文件管理器
      loupe # 图片查看器
      gnome-text-editor # 文本编辑器
      showtime
      # evince
      papers
    ]
    ++ (with gnomeExtensions; [
      appindicator # 系统托盘
      dash-to-dock # dock栏
      # open-bar
      # night-theme-switcher # 夜间模式
      clipboard-history # 剪贴板管理
      caffeine # 防止锁屏
      blur-my-shell # 透明黑框背景
      kimpanel # 输入法面板
      # gsconnect # 连接手机
    ]);
  # };
  home-manager.users."binigo" = {
    dconf = {
      enable = true;
      settings = {
        "org/gnome/settings-daemon/plugins/media-keys" = {
          custom-keybindings = [
            "/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0/"
          ];
        };
        "org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0" = {
          name = "启动kitty终端";
          command = "kitty";
          binding = "<Primary><Alt>t";
        };
        #   "org/gnome/desktop/interface" = {
        # #   # color-scheme = "prefer-dark";
        # #     document-font-name = "Maple Mono NF CN 11";
        # #     monospace-font-name = "Maple Mono NF CN 11";
        #     accent-color = "teal";
        # };
      };
    };
  };
}
