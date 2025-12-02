{ pkgs, ... }:
{
  i18n.inputMethod = {
    enable = true;
    type = "fcitx5";
    fcitx5 = {
      addons = with pkgs; [
        # qt6Packages.fcitx5-chinese-addons
        # libsForQt5.fcitx5-qt
        # kdePackages.fcitx5-qt
        (fcitx5-rime.override {
          rimeDataPkgs = [
            rime-ice
            rime-moegirl
            rime-zhwiki
            # catppuccin-fcitx5
          ];
        })
      ];
      waylandFrontend = true;
    };
  };
}
