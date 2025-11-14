{pkgs,...}:{
  services.desktopManager.plasma6.enable = true;

  services.displayManager.sddm = {
    enable = true;
    wayland.enable = true;
    theme = "sddm-astronaut-theme";
    # package = pkgs.kdePackages.sddm;
    extraPackages = [ pkgs.kdePackages.qtmultimedia ];

    settings = {
      Wayland = {
        EnableHiDPI = true;
      };
    };
  };
    environment.systemPackages = [
      (pkgs.sddm-astronaut.override {
        embeddedTheme = "astronaut";
        themeConfig = {
          General = ''
            HeaderText="请使用指纹或密码解锁"
          '';
        };
      })
    ];
}