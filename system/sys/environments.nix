{
  pkgs,
  my-pkgs,
  ...
}:
{
  environment.systemPackages =
    with pkgs;
    [
      wget
      git
      fastfetch
      zip
      unzip
      nix-output-monitor
      unrar
      btop
    ]
    ++ (with my-pkgs; [
      # qq
      #wpsoffice
    ]);
  programs.nix-ld.enable = true;

  # programs = {
  #   adb.enable = true;
  #   git.enable = true;
  #   appimage = {
  #     enable = true;
  #     binfmt = true;
  #   };
  #   zoxide.enable = true;
  # };

  environment.localBinInPath = true;

  environment.variables = {
    NIXOS_OZONE_WL = "1";
    # EDITOR = "nvim";
    # XDG_TERMINAL_EXECUTOR = "kitty";
    GOPROXY = "https://goproxy.cn,direct";
    GO111MODULE = "on";
  };
  xdg.terminal-exec = {
    enable = true;
    settings = {
      default = [ "kitty.desktop" ];
    };
  };

}
