{
  inputs,
  userName,
  my-pkgs,
  ...
}:
{
  imports = [
    ../system
    ../desktop
  ];

  # nixpkgs.config = {
  #   allowUnfree = true;
  #   allowBroken = false;
  # };
  #
  home-manager = {
    useGlobalPkgs = true;
    useUserPackages = true;
    extraSpecialArgs = { inherit inputs userName my-pkgs; };
    users = {
      "${userName}" = import ../home;
    };
    backupFileExtension = "backup";
  };

  system = {
    stateVersion = "25.05"; # Did you read the comment?
    autoUpgrade.channel = "https://mirrors.ustc.edu.cn/nix-channels/nixos-unstable";
  };
}
