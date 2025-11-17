{
  pkgs,
  lib,
  ...
}:

{
  imports = [
    ./sddm.nix
    # ./noctalia/default.nix

  ];
  # services.displayManager.ly.enable = true;
  home-manager.users."binigo" = {
    imports = [
      ./dotfiles.nix
      ./swayidle.nix
      ./waypaper.nix
      ./mako.nix
      ./vicinae.nix
      ./waybar.nix
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
    nautilus
    file-roller
    yazi
    nmgui
    easyeffects
  ];

  programs = {
    xwayland.enable = true;
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
          default = [ "gnome" ];
          "org.freedesktop.impl.portal.FileChooser" = [ "gtk" ];
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
}
