{
  inputs,
  userName,
  ...
}:
{
  imports = [
    ../system/init.nix
    ../desktop/init.nix
    inputs.home-manager.nixosModules.default
  ];

  nixpkgs.config = {
    allowUnfree = true;
    allowBroken = false;
  };

  home-manager = {
    useGlobalPkgs = true;
    useUserPackages = true;
    extraSpecialArgs = { inherit inputs userName; };
    users = {
      "${userName}" = import ./home.nix;
    };
    backupFileExtension = "backup";
  };

  system = {
    stateVersion = "25.05"; # Did you read the comment?
    autoUpgrade.channel = "https://mirrors.ustc.edu.cn/nix-channels/nixos-unstable";
  };
}
