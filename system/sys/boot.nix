{ pkgs, inputs, ... }:
{
  boot = {
    loader = {
      systemd-boot.enable = true;
      efi.canTouchEfiVariables = true;
      systemd-boot.configurationLimit = 10;
    };
    # kernelPackages = pkgs.linuxPackages_zen;
    kernelPackages = pkgs.cachyosKernels.linuxPackages-cachyos-latest-lto;
  };

  nixpkgs.overlays = [ inputs.nix-cachyos-kernel.overlays.pinned ];

  # boot.kernelPackages = pkgs.linuxPackages_cachyos-lto;
  # boot.kernelPackages = pkgs.linuxPackages_xanmod_latest;
}
