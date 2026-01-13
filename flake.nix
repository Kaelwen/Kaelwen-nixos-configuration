{
  description = "A simple NixOS flake";
  inputs = {
    # NixOS 官方软件源，这里使用 nixos-25.05 分支
    nixpkgs.url = "nixpkgs/nixos-unstable";
    flake-utils.url = "github:numtide/flake-utils";
    flake-parts.url = "github:hercules-ci/flake-parts";
    # nixpkgs-stable.url = "github:nixos/nixpkgs/nixos-25.05";
    # nixpkgs.url = "github:nixos/nixpkgs/nixos-25.05";

    # nur = {
    #   url = "github:nix-community/NUR";
    #   inputs.nixpkgs.follows = "nixpkgs";
    # };

    chaotic.url = "github:chaotic-cx/nyx/nyxpkgs-unstable";

    # quickshell = {
    #   url = "github:outfoxxed/quickshell";
    #   inputs.nixpkgs.follows = "nixpkgs";
    # };
    # noctalia = {
    #   url = "github:noctalia-dev/noctalia-shell";
    #   inputs.nixpkgs.follows = "nixpkgs";
    #   inputs.quickshell.follows = "quickshell"; # Use same quickshell version
    # };

    home-manager = {
      # url = "github:nix-community/home-manager/release-25.11";
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    stylix = {
      # url = "github:nix-community/stylix/release-25.11";
      url = "github:nix-community/stylix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    # winapps = {
    #   url = "github:winapps-org/winapps";
    #   inputs.nixpkgs.follows = "nixpkgs";
    #   inputs.flake-utils.follows = "flake-utils";
    # };

    nixvim.url = "github:nix-community/nixvim";
    # minecraft-plymouth-theme = {
    #   url = "github:nikp123/minecraft-plymouth-theme";
    #   inputs = {
    #     flake-parts.follows = "flake-parts";
    #     nixpkgs.follows = "nixpkgs";
    #   };

    # };
    zen-browser = {
      url = "github:0xc000022070/zen-browser-flake";
      inputs = {
        nixpkgs.follows = "nixpkgs";
        home-manager.follows = "home-manager";
      };
    };

    myNixpkgs = {
      url = "git+https://gitee.com/binigo/nixos-repo-of-binigo.git";
      inputs.nixpkgs.follows = "nixpkgs"; # 🔴 关键：让 myNixpkgs 复用系统的 nixpkgs 25.05，避免依赖冲突
    };
  };
  outputs =
    { self, nixpkgs, ... }@inputs:
    let
      userName = "binigo";
    in
    {
      nixosConfigurations.nixos = nixpkgs.lib.nixosSystem rec {
        system = "x86_64-linux";
        specialArgs = {

          # pkgs-stable = import nixpkgs-stable {
          #   inherit system;
          #   config.allowUnfree = true; # 允许非自由软件（如Chrome）
          # };
          my-pkgs = inputs.myNixpkgs.packages.${system};
          inherit self inputs userName;
        };
        modules = [
          ./host/configuration.nix

          inputs.chaotic.nixosModules.default
          inputs.home-manager.nixosModules.default
          # inputs.minecraft-plymouth-theme.nixosModules.default
          inputs.stylix.nixosModules.stylix
          # {
          # environment.systemPackages = [
          # winapps.packages."${system}".winapps
          # ];
          # }

          #inputs.noctalia.packages.${system}.default
          # nur.modules.nixos.default
          # nur.legacyPackages."${system}".repos.iopq.modules.xraya
        ];
      };
    };
}
