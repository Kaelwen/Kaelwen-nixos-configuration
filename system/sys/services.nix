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
  # hardware.bluetooth.enable = true;

  services = {
    flatpak.enable = true; # 软件包

    power-profiles-daemon.enable = true;

    linyaps.enable = true;

    # printing.enable = true;#打印机

    usbguard.dbus.enable = true;

    udisks2.enable = true;

    upower.enable = true;

    envfs.enable = false;

    speechd.enable = lib.mkForce false;

  };
}
