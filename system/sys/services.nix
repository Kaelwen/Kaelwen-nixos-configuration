{ lib, pkgs, ... }:
{

  services.xserver = {
    enable = true;
    excludePackages = [ pkgs.xterm ];
    # upscaleDefaultCursor = true;
  };

  services.xserver.xkb = {
    layout = "cn";
    variant = "";
  };

  services = {
    flatpak.enable = true; # 软件包

    power-profiles-daemon.enable = true;

    # linyaps.enable = true;

    dbus.enable = true;

    # printing.enable = true;#打印机

    usbguard.dbus.enable = true;

    udisks2.enable = true;

    upower.enable = true;

    envfs.enable = false;

    gvfs.enable = true;

    seatd.enable = true;

    openssh.enable = false;

    acpid.enable = true;

    speechd.enable = lib.mkForce false;

  };
}
