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
    package = pkgs.niri;
  };
  services.dbus.packages = [ pkgs.nautilus ];
  imports = [
    inputs.niri.nixosModules.niri
    ./sddm.nix
  ];

  home-manager.users."${userName}" = {

    services.polkit-gnome.enable = true;

    imports = [
      ./component
      ./settings.nix
      ./rules.nix
      ./binds.nix
      ./scripts/screenshot
    ];
  };

}
