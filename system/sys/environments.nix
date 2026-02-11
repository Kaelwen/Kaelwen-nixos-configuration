{
  pkgs,
  ...
}:
{
  environment.systemPackages = with pkgs; [
    wget
    git
    zip
    unzip
    nix-output-monitor
    unrar
    mesa
    # intel-vaapi-driver
    # bibata-cursors
    ffmpeg
    # kdePackages.ksshaskpass

  ];

  programs.nix-ld.enable = true;

  environment.localBinInPath = true;

  environment.variables = {
    NIXOS_OZONE_WL = "1";
    EDITOR = "nvim";
    QT_AUTO_SCREEN_SCALE_FACTOR = "1";
    MOZ_ENABLE_WAYLAND = "1";
  };

  documentation = {
    nixos.enable = false;
  };

}
