{
  pkgs,
  ...
}:

{
  programs.lutris = {
    enable = true;
    extraPackages = with pkgs; [
      mangohud
      #proton-cachyos_x86_64_v4
      winetricks
      gamescope
      gamemode
    ];

  };
}
