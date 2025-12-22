{
  pkgs,
  lib,
  ...
}:
{
  imports = [
    ./sddm.nix
    ./gtklock.nix

    # ./noctalia/default.nix
    ./overlays.nix
  ];
  home-manager.users."binigo" = {
    imports = [
      ./dotfiles/default.nix
      ./swayidle.nix
      ./waypaper.nix
      ./mako.nix
      # ./vicinae.nix
      # ./waybar.nix
      # ./fuzzel.nix
      # ./wofi.nix
    ];
    xresources.properties = {
      "Xft.dpi" = 144;
    };
  };
  environment.systemPackages = with pkgs; [
    # pwvucontrol
    brightnessctl
    # loupe
    xwayland-satellite
    swayimg
    mpv # 视频播放器
    file-roller # 文件解压
    papers # pdf阅读器
    nmgui
    easyeffects
    blueberry
    nautilus
    waybar
    wofi
    wlogout
    # wleave
    # cliphist
    wl-clipboard
    clipman
    # swaylock-effects
  ];

  programs.niri.enable = true;
  services = {
    # xserver.desktopManager.runXdgAutostartIfNone = true;
    gnome.gnome-keyring.enable = lib.mkForce false;
    gvfs.enable = true;
    seatd.enable = true;
  };

  xdg = {
    portal = {
      enable = true;
      xdgOpenUsePortal = true;
      configPackages = [ pkgs.niri ];
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
