{
  pkgs,
  lib,
  userName,
  ...
}:
{
  imports = [
    ./sddm.nix
  ];
  home-manager.users."${userName}" = {
    imports = [
      ./niri-config
      # ./dms/default.nix
      ./swayidle
      # ./waypaper/default.nix
      ./mako
      ./waybar

      ./wofi
      ./thunar
      ./rofi
      ./swaylock
    ];

  };
  environment.systemPackages = with pkgs; [
    xwayland-satellite
    mpv # 视频播放器
    file-roller # 文件解压
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
      wlr.enable = true;
      # extraPortals = with pkgs; [
      #   xdg-desktop-portal-gtk
      # ];
    };
    autostart.enable = true;
    icons.fallbackCursorThemes = [ "Bibata-Modern-Classic" ];
  };
  services.acpid.enable = true;
}
