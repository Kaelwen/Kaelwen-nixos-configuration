{
  pkgs,
  lib,
  userName,
  ...
}:
{
  imports = [
    ./sddm.nix
    ./gtklock/default.nix
  ];
  home-manager.users."${userName}" = {
    imports = [
      ./niri-config/default.nix
      # ./dms/default.nix
      ./swayidle/default.nix
      ./waypaper/default.nix
      ./mako/default.nix
      ./waybar/default.nix

      ./wofi/default.nix
      ./thunar/default.nix
      ./rofi/default.nix
    ];

  };
  environment.systemPackages = with pkgs; [
    xwayland-satellite
    mpv # 视频播放器
    file-roller # 文件解压
    wlogout
    wl-clipboard
    clipman
    labwc
    # niri
  ];

  programs.niri.enable = true;
  services = {
    xserver.desktopManager.runXdgAutostartIfNone = true;
    gnome.gnome-keyring.enable = lib.mkForce false;
    gvfs.enable = true;
    seatd.enable = true;
  };

  xdg = {
    portal = {
      enable = true;
      xdgOpenUsePortal = true;
      extraPortals = with pkgs; [
        xdg-desktop-portal-wlr
        xdg-desktop-portal-gtk
      ];
      config.common = {
        default = [
          "gtk"
          "wlr"
        ];
        "org.freedesktop.impl.portal.FileChooser" = [ "gtk" ];
      };
    };
    autostart.enable = true;
    icons.fallbackCursorThemes = [ "Bibata-Modern-Classic" ];
  };
  services.acpid.enable = true;
}
