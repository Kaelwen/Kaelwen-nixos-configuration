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
  # networking.hosts = {
  #   "185.199.108.154" = [ "github.githubassets.com" ];
  #   "140.82.112.22" = [ "central.github.com" ];
  #   "185.199.108.133" = [
  #     "desktop.githubusercontent.com"
  #     "assets-cdn.github.com"
  #     "camo.githubusercontent.com"
  #     "github.map.fastly.net"
  #     "github.io"
  #     "raw.githubusercontent.com"
  #     "user-images.githubusercontent.com"
  #     "favicons.githubusercontent.com"
  #     "avatars5.githubusercontent.com"
  #     "avatars4.githubusercontent.com"
  #     "avatars3.githubusercontent.com"
  #     "avatars2.githubusercontent.com"
  #     "avatars1.githubusercontent.com"
  #     "avatars0.githubusercontent.com"
  #     "avatars.githubusercontent.com"
  #     "media.githubusercontent.com"
  #   ];
  #   "199.232.69.194" = [ "github.global.ssl.fastly.net" ];
  #   "140.82.114.3" = [ "gist.github.com" ];
  #   "140.82.113.3" = [ "github.com" ];
  #   "140.82.112.5" = [ "api.github.com" ];
  #   "140.82.112.10" = [ "codeload.github.com" ];
  #   "52.217.207.1" = [ "github-cloud.s3.amazonaws.com" ];
  #   "52.216.78.4" = [ "github-com.s3.amazonaws.com" ];
  #   "52.217.194.169" = [ "github-production-release-asset-2e65be.s3.amazonaws.com" ];
  #   "52.216.131.131" = [ "github-production-user-asset-6210df.s3.amazonaws.com" ];
  #   "52.216.28.204" = [ "github-production-repository-file-5c1aeb.s3.amazonaws.com" ];
  #   "185.199.108.153" = [ "githubstatus.com" ];
  #   "64.71.144.202" = [ "github.community" ];
  # };

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
