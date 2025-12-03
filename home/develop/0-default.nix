{ ... }:
{
  imports = [
    ./distrobox/default.nix
    # ./uv.nix
    ./pixi.nix
    # ./zed/0-default.nix
    ./helix.nix
    ./environments.nix
    ./direnv/default.nix
    # ./yazi.nix
    ./code.nix
  ];

}
