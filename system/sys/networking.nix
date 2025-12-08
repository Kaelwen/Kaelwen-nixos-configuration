{ ... }:
{
  networking = {
    hostName = "nixos";

    modemmanager.enable = false;
    networkmanager = {
      enable = true;
      wifi = {
        macAddress = "random";
        backend = "iwd";
      };
    };
  };
}
