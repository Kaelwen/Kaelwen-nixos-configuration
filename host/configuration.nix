{
  inputs,
  pkgs,
  ...
}:
{
  imports = [
    ../system/init.nix
    ../desktop/init.nix
    inputs.home-manager.nixosModules.default
  ];

  nix = {
    package = pkgs.lixPackageSets.git.lix;
    settings = {
      auto-optimise-store = true;
      builders-use-substitutes = true;
      experimental-features = [
        "nix-command"
        "flakes"
      ];
      substituters = [
        "https://mirrors.tuna.tsinghua.edu.cn/nix-channels/store?priority=10" # 添加清华大学镜像源，提高下载速度
        "https://mirrors.ustc.edu.cn/nix-channels/store?priority=5" # 添加中科大镜像源
        "https://cache.nixos.org/" # 默认官方缓存
      ];
    };
  };

  # services.displayManager.gdm.enable = true;
  nixpkgs.config = {
    allowUnfree = true;
    allowBroken = false;
  };

  home-manager = {
    useGlobalPkgs = true;
    useUserPackages = true;
    extraSpecialArgs = { inherit inputs; };
    users = {
      "binigo" = import ./home.nix;
    };
    backupFileExtension = "backup";
  };

  system = {
    stateVersion = "25.05"; # Did you read the comment?
    autoUpgrade.channel = "https://mirrors.ustc.edu.cn/nix-channels/nixos-unstable";
  };
}
