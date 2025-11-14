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
    ];
  };
  environment.systemPackages = with pkgs; [
    pwvucontrol
    brightnessctl
    loupe
    xwayland-satellite
    nemo-with-extensions
    # nautilus
    file-roller
    nmgui
    waybar
    # fuzzel
    mako
    swayidle
    swaybg
    vicinae
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
  services.xserver.dpi = 120;
  services.acpid.enable = true;
}
