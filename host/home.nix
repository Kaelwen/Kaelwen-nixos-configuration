{
  lib,
  ...
}:

{
  imports = [
    ../home/apps/0-default.nix
    ../home/develop/0-default.nix
    ../home/setting/0-default.nix
    ../home/terminal/0-default.nix
  ];
  programs.home-manager.enable = true;

  home = {
    username = "binigo";
    homeDirectory = "/home/binigo";

    shell.enableFishIntegration = true;
    preferXdgDirectories = true;
    activation.installPackages = {
      data = lib.mkForce "";
      before = lib.mkForce [ ];
      after = lib.mkForce [ ];
    };

    stateVersion = "25.05";
  };
}
