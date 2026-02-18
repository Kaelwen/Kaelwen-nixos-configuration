{
  description = "A simple NixOS flake";
  inputs = {
    # NixOS 官方软件源，这里使用 nixos-25.05 分支
    nixpkgs.url = "nixpkgs/nixos-unstable";
    # nixpkgs.url = "nixpkgs/nixos-25.11";
    flake-parts.url = "github:hercules-ci/flake-parts";

    chaotic = {
      url = "github:chaotic-cx/nyx/nyxpkgs-unstable";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    #
    noctalia = {
      url = "github:noctalia-dev/noctalia-shell";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    # dms = {
    #   url = "github:AvengeMedia/DankMaterialShell/stable";
    #   inputs.nixpkgs.follows = "nixpkgs";
    # };
    niri = {
      url = "github:sodiboo/niri-flake";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    stylix = {
      url = "github:nix-community/stylix";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nixvim = {
      url = "github:nix-community/nixvim";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    # minecraft-plymouth-theme = {
    #   url = "github:nikp123/minecraft-plymouth-theme";
    #   inputs = {
    #     flake-parts.follows = "flake-parts";
    #     nixpkgs.follows = "nixpkgs";
    #   };
    # };
    # nix-cachyos-kernel = {
    #   url = "github:xddxdd/nix-cachyos-kernel";
    #   inputs.nixpkgs.follows = "nixpkgs";
    # };
    # zen-browser = {
    #   url = "github:0xc000022070/zen-browser-flake";
    #   inputs = {
    #     nixpkgs.follows = "nixpkgs";
    #   };
    # };

    myNixpkgs = {
      url = "git+https://gitee.com/binigo/nixos-repo-of-binigo.git";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };
  outputs =
    { self, ... }@inputs:
    inputs.flake-parts.lib.mkFlake { inherit inputs; } {
      systems = [ "x86_64-linux" ];
      imports = [
        ./hosts/laptop
        { _module.args = { inherit inputs self; }; }
      ];
    };
}
