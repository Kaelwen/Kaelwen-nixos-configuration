{
  userName,
  inputs,
  pkgs,
  ...
}:
{
  nixpkgs.overlays = [ inputs.niri.overlays.niri ];
  programs.niri = {
    enable = true;
    package = pkgs.niri-unstable;
  };
  services.dbus.packages = [ pkgs.nautilus ];
  imports = [
    inputs.niri.nixosModules.niri
    ./sddm.nix
  ];

  home-manager.users."${userName}" = {
    home.packages = with pkgs; [ nautilus ];
    imports = [
      ./component
      ./settings.nix
      ./rules.nix
      ./binds.nix
    ];
  };

}
