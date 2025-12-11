{
  pkgs,
  lib,
  ...
}:

{
  imports = [
    ./sddm.nix
    # ./noctalia/default.nix
    ./overlays.nix
  ];
  # services.displayManager.ly.enable = true;
  home-manager.users."binigo" = {
    imports = [
      ./dotfiles/default.nix
      ./swayidle.nix
      ./waypaper.nix
      ./mako.nix
      ./vicinae.nix
      ./waybar.nix
      # ./fuzzel.nix
    ];
    xresources.properties = {
      "Xft.dpi" = 144;
    };
  };
  environment.systemPackages = with pkgs; [
    # pwvucontrol
    brightnessctl
    loupe
    xwayland-satellite
    mpv # 视频播放器
    file-roller # 文件解压
    # yazi # 文件管理器
    kdePackages.okular # pdf阅读器
    nmgui
    easyeffects
    blueberry
    nautilus
  ];

  programs = {
    # xwayland.enable = true;
    niri.enable = true;
    gtklock.enable = true;
  };
  services = {
    xserver.desktopManager.runXdgAutostartIfNone = true;
    gnome.gnome-keyring.enable = lib.mkForce false;
    gvfs.enable = true;
    seatd.enable = true;
  };

  security.pam.services.gtklock.text = lib.readFile "${pkgs.gtklock}/etc/pam.d/gtklock";

  xdg = {
    portal = {
      enable = true;
      xdgOpenUsePortal = true;
      config = {
        common = {
          default = [
            "gnome"
            "gtk"
          ];
          "org.freedesktop.impl.portal.FileChooser" = [ "gnome" ];
          "org.freedesktop.impl.portal.Access" = [ "gtk" ];
          "org.freedesktop.impl.portal.Notification" = [ "gtk" ];
        };
      };
      extraPortals = [
        pkgs.xdg-desktop-portal-gtk
        pkgs.xdg-desktop-portal-gnome
      ];
    };
    autostart.enable = true;
    icons.fallbackCursorThemes = [ "Bibata-Modern-Classic" ];
  };
  services.acpid.enable = true;
  hardware.bluetooth.enable = true;
}
