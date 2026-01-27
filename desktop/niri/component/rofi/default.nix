{ pkgs, config, ... }:
{
  home.packages = with pkgs; [
    rofi
    cliphist
    wl-clipboard
    swww
  ];

  xdg.configFile."rofi/config.rasi".source = ./dotfiles/config.rasi;
  xdg.configFile."rofi/themes".source = ./dotfiles/themes;
  xdg.configFile."rofi/images".source = ./dotfiles/images;
  xdg.configFile."rofi/scripts".source = ./dotfiles/scripts;
  home.file.".config/rofi/colors.rasi".text =
    #rasi
    ''
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

  programs.niri.settings = {
    spawn-at-startup = [
      { command = [ "~/.config/rofi/scripts/bg-setup.sh" ]; }
    ];
    binds = {
      "Mod+D" = {
        hotkey-overlay.title = "打开搜索";
        repeat = false;
        action.spawn = [ "~/.config/rofi/scripts/launcher.sh" ];
      };
      "Mod+C" = {
        hotkey-overlay.title = "打开剪切板";
        repeat = false;
        action.spawn = [ "~/.config/rofi/scripts/clip.sh" ];
      };
      "Mod+W" = {
        hotkey-overlay.title = "打开壁纸选择器";
        repeat = false;
        action.spawn = [ "~/.config/rofi/scripts/wallpaper.sh" ];
      };
    };
  };

}
