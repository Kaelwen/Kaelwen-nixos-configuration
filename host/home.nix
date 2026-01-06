{
  lib,
  userName,
  ...
}:

{
  imports = [
    ../home/develop/0-default.nix
    ../home/setting/0-default.nix
    ../home/terminal/0-default.nix
    ../home/game/0-default.nix
    ../home/tools/0-default.nix
    ../home/browser/0-default.nix
    ../home/daily/0-default.nix
  ];
  programs.home-manager.enable = true;
  home = {
    username = "${userName}";
    homeDirectory = "/home/${userName}";

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
