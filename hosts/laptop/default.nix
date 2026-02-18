{
  inputs,
  self,
  ...
}:
let
  hostName = "nixos";
  userName = "binigo";
in
{
  flake = {
    nixosConfigurations.${hostName} = inputs.nixpkgs.lib.nixosSystem {
      specialArgs = {
        inherit
          inputs
          # nixpkgs
          self
          hostName
          userName
          ;
      };
      modules = [
        inputs.stylix.nixosModules.stylix
        ../../system
        ../../common
        ./hardware-configuration.nix
      ];
    };
    homeConfigurations."${userName}@${hostName}" = inputs.home-manager.lib.homeManagerConfiguration {
      pkgs = inputs.nixpkgs.legacyPackages."x86_64-linux";
      extraSpecialArgs = {
        inherit
          inputs
          self
          hostName
          userName
          ;
      };
      modules = [
        inputs.stylix.homeModules.stylix
        inputs.niri.homeModules.niri
        ../../common
        ../../home
      ];
    };
  };

}
