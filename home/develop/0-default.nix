{ ... }:
{
  imports = [
    ./distrobox.nix
    # ./uv.nix
    ./pixi.nix
    ./zed.nix
    ./helix.nix
    ./environments.nix
    ./direnv/default.nix
  ];

}
