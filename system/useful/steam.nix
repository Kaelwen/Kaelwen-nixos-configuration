{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [ steam-run ];

  programs.steam = {
    enable = true;
    remotePlay.openFirewall = true;
    dedicatedServer.openFirewall = true;
    localNetworkGameTransfers.openFirewall = true;
    gamescopeSession.enable = true;

    extraPackages = with pkgs; [
      # mangohud_git
      zulu8
    ];
    extraCompatPackages = with pkgs; [
      # proton-cachyos_x86_64_v4
      # proton-ge-custom
      proton-ge-bin
      # luxtorpeda
    ];
  };
  programs.gamescope = {
    enable = true;
    # package = pkgs.gamescope_git;
    args = [
      "--borderless"
      "--backend auto"
      "--force-grab-cursor"
      #   "-W 3072"
      #   "-H 1920"
    ];
  };

  hardware.steam-hardware.enable = true;
}
