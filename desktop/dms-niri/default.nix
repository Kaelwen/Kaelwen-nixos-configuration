{ inputs, userName, ... }:
{
  imports = [
    inputs.dms.nixosModules.greeter
  ];
  services.displayManager.dms-greeter = {
    enable = true;
    compositor.name = "niri";
  };

  home-manager.users."${userName}" = {
    imports = [
      ./dms/default.nix
    ];
  };
}
