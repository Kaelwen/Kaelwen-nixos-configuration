{
  pkgs,
  ...
}:

{
  programs.fish.enable = true;
  users.defaultUserShell = pkgs.fish;

  environment.systemPackages = with pkgs; [
    bat
    tealdeer
    dust
    fd
    tokei
    duf
  ];
}
