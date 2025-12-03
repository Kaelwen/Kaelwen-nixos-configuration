{ pkgs, ... }:
{
  home-manager.users."binigo" = {
    imports = [
      ./binds.nix
      ./dotfiles.nix
      ./extensions/0-default.nix
    ];
  };
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
    gnome-online-accounts.enable = false;
    gnome-settings-daemon.enable = true;

  };

  # services.udev.packages = [ pkgs.gnome-settings-daemon ];

  environment.systemPackages = with pkgs; [
    nautilus # 文件管理器
    # nemo-with-extensions
    loupe # 图片查看器
    # gnome-text-editor # 文本编辑器
    showtime
    # papers
    dconf-editor
    gnome-music
    gnome-connections

    # papers
  ];
  programs.nautilus-open-any-terminal.enable = true;
  services.gnome.sushi.enable = true;
}
