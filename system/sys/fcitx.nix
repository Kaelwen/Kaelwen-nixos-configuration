{ pkgs, ... }:
{
  i18n.inputMethod = {
    enable = true;
    type = "fcitx5";
    fcitx5 = {
      addons = with pkgs; [
        # qt6Packages.fcitx5-chinese-addons
        (fcitx5-rime.override {
          rimeDataPkgs = [
            rime-ice
            rime-moegirl
            rime-zhwiki
          ];
        })

      ];
      # ignoreUserConfig = true;
      waylandFrontend = true;
      # settings = {
      #   inputMethod = {
      #     "Groups/0" = {
      #       Name = "Default";
      #       "Default Layout" = "us";
      #       DefaultIM = "keyboard-us";
      #     };
      #     "Groups/0/Items/0".Name = "keyboard-us";
      #     "Groups/0/Items/1".Name = "rime";
      #     # "Groups/0/Items/2".Name = "mozc";
      #   };
      # };
    };
  };
}
