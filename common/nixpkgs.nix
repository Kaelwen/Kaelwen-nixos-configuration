{ lib, ... }:
{
  nixpkgs.config = {
    allowUnfree = true;
    allowBroken = false;
  };
  # nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";
}
