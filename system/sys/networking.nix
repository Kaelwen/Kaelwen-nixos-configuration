{ hostName, ... }:
{
  networking = {
    hostName = "${hostName}";

    modemmanager.enable = false;
    networkmanager = {
      enable = true;
      wifi = {
        macAddress = "random";
        backend = "iwd";
      };
    };

    # Open ports in the firewall.
    firewall = {
      allowedTCPPorts = [
        7897
        53
      ];
      allowedUDPPorts = [
        7897
        53
      ];
      trustedInterfaces = [ "mihomo" ];
      # Or disable the firewall altogether.
      enable = false;
    };
  };
}
