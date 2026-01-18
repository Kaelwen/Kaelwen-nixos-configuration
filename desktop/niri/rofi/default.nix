{ pkgs, config, ... }:
{
  home.packages = with pkgs; [
    rofi
    cliphist
    wl-clipboard
  ];

  xdg.configFile."rofi/config.rasi".source = ./dotfiles/config.rasi;
  xdg.configFile."rofi/themes/launcher.rasi".source = ./dotfiles/themes/launcher.rasi;
  xdg.configFile."rofi/themes/powermenu.rasi".source = ./dotfiles/themes/powermenu.rasi;
  xdg.configFile."rofi/themes/clip.rasi".source = ./dotfiles/themes/clip.rasi;
  xdg.configFile."rofi/themes/wallpaper.rasi".source = ./dotfiles/themes/wallpaper.rasi;
  xdg.configFile."rofi/images".source = ./dotfiles/images;
  xdg.configFile."rofi/scripts".source = ./dotfiles/scripts;
  home.file.".config/rofi/themes/colors.rasi".text = ''
    * {
        font:                        "Maple Mono NF CN 10";
        background:                  #${config.lib.stylix.colors.base00};
        background-alt:              #${config.lib.stylix.colors.base02};
        foreground:                  #${config.lib.stylix.colors.base05};
        selected:                    #${config.lib.stylix.colors.base07};
        active:                      #${config.lib.stylix.colors.base02};
        urgent:                      #${config.lib.stylix.colors.base08};
    } 
  '';
  # services.cliphist = {
  #   enable = true;
  #   allowImages = true;
  #   clipboardPackage = pkgs.wl-clipboard;
  # };
}
