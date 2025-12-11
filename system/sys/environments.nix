{
  pkgs,
  ...
}:
{
  environment.systemPackages = with pkgs; [
    wget
    git
    fastfetch
    zip
    unzip
    nix-output-monitor
    unrar
    btop
    mesa
    # catppuccin-cursors
    intel-vaapi-driver
  ];
  # ++ (with my-pkgs; [
  #   # qq
  #   wpsoffice
  # ]);
  programs.nix-ld.enable = true;

  environment.localBinInPath = true;

  environment.variables = {
    NIXOS_OZONE_WL = "1";
    EDITOR = "hx";
    QT_AUTO_SCREEN_SCALE_FACTOR = "1";
    MOZ_ENABLE_WAYLAND = "1";
  };
  xdg.terminal-exec = {
    enable = true;
    settings = {
      default = [ "kitty.desktop" ];
    };
  };
  documentation = {
    nixos.enable = false;
  };

}
