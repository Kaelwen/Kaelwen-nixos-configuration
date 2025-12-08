{ ... }:
{
  # Open ports in the firewall.
  networking.firewall.allowedTCPPorts = [
    7897
    53
  ];
  networking.firewall.allowedUDPPorts = [
    7897
    53
  ];
  networking.firewall.trustedInterfaces = [ "mihomo" ];
  # Or disable the firewall altogether.
  networking.firewall.enable = false;
}
