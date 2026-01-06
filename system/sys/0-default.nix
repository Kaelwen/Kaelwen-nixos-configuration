{ ... }:
{
  imports = [
    ./boot.nix
    ./docker.nix
    # ./podman.nix
    ./environments.nix
    ./fcitx.nix
    ./firewall.nix
    ./fonts.nix
    ./hardware-configuration.nix
    ./hardware.nix
    ./i18n.nix
    ./networking.nix
    ./openssh.nix
    ./pipewire.nix
    ./services.nix
    ./plymouth.nix
    ./nix.nix
    ./user.nix
  ];
}
