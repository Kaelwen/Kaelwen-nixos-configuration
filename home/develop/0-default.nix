{ ... }:
{
  imports = [
    ./distrobox/default.nix
    # ./uv.nix
    ./pixi.nix
    # ./helix.nix
    ./environments.nix
    ./direnv/default.nix
    ./vscodium.nix
    ./yazi.nix
    # ./stm32.nix
    ./nixvim/default.nix
    # ./zed.nix
  ];

}
