{ ... }:
{
  services.xserver.desktopManager.cinnamon = {
    enable = true;
  };
  services.cinnamon.apps.enable = false;
  services.xserver.displayManager.lightdm.enable = true;
}
