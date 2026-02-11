{
  pkgs,
  config,
  inputs,
  ...
}:

{
  imports = [
    inputs.stylix.nixosModules.stylix
  ];
  stylix = {
    enable = true;
    overlays.enable = true;
    # base16Scheme = "${pkgs.base16-schemes}/share/themes/catppuccin-frappe.yaml";
    base16Scheme = "${pkgs.base16-schemes}/share/themes/catppuccin-mocha.yaml";
    # base16Scheme = "${pkgs.base16-schemes}/share/themes/material-darker.yaml";
    # base16Scheme = "${pkgs.base16-schemes}/share/themes/onedark.yaml";
    # base16Scheme = "${pkgs.base16-schemes}/share/themes/penumbra-dark.yaml";

    polarity = "dark";
    cursor = {
      package = pkgs.bibata-cursors;
      # name = "Bibata-Modern-Ice";
      name = "Bibata-Modern-Classic";
      size = 26;
    };

    fonts = {
      serif = config.stylix.fonts.sansSerif;

      sansSerif = {
        package = pkgs.sarasa-gothic;
        name = "Sarasa Gothic SC";
      };

      monospace = {
        package = pkgs.maple-mono.NF-CN;
        name = "Maple Mono NF CN";
      };

      emoji = {
        package = pkgs.noto-fonts-color-emoji;
        name = "Noto Color Emoji";
      };

      sizes = {
        applications = 11;
        desktop = 10;
        popups = 10;
        terminal = 11;
      };
    };

    icons = {
      enable = true;
      package = pkgs.whitesur-icon-theme;
      dark = "WhiteSur";
      light = "WhiteSur";
    };

    opacity = {
      desktop = 0.9;
      popups = 0.95;
      terminal = 0.8;
    };
  };
}
