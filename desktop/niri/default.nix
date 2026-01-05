{
  pkgs,
  lib,
  ...
}:
{
  imports = [
    ./sddm.nix
    ./gtklock/default.nix

    # ./noctalia/default.nix
    ./overlays.nix
  ];
  home-manager.users."binigo" = {
    imports = [
      ./niri-config/default.nix
      ./swayidle/default.nix
      ./waypaper/default.nix
      ./mako/default.nix
      ./waybar/default.nix
      # ./fuzzel.nix
      ./wofi/default.nix
      ./thunar/default.nix
    ];
    xresources.properties = {
      "Xft.dpi" = 144;
    };
  };
  environment.systemPackages = with pkgs; [
    xwayland-satellite
    mpv # 视频播放器
    file-roller # 文件解压
    wlogout
    wl-clipboard
    clipman
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
      # configPackages = [ pkgs.niri ];
      extraPortals = [
        pkgs.xdg-desktop-portal-gtk
        pkgs.xdg-desktop-portal-gnome
      ];
    };
    autostart.enable = true;
    icons.fallbackCursorThemes = [ "Bibata-Modern-Classic" ];
  };
  services.acpid.enable = true;
}
