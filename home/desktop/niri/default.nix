{
  services.polkit-gnome.enable = true;

  imports = [
    ./component
    ./settings.nix
    ./rules.nix
    ./binds.nix
    ./scripts/screenshot
  ];

}
