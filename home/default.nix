{
  lib,
  inputs,
  userName,
  ...
}:

{
  imports = [
    ./develop
    ./setting
    ./terminal
    ./game
    ./tools
    ./browser
    ./daily

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
