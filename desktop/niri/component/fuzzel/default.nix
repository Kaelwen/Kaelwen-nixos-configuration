{
  lib,
  config,
  pkgs,
  ...
}:
let
  colors = config.lib.stylix.colors;
in
{
  home.packages = with pkgs; [
    cliphist
    wl-clipboard
    swww
  ];
  programs.fuzzel = {
    enable = true;
    settings = {
      main = {
        font = lib.mkForce "monospace:size=10"; # 设置字体及大小
        prompt = "干嘛？"; # 输入提示符
        icons-enabled = "yes"; # 是否启用应用图标
        lines = 12; # 显示的匹配项数量
        width = 56; # 窗口宽度（以字符为单位）
        line-height = 30;
      };
      colors = lib.mkForce {
        background = "${colors.base00}cc"; # 背景颜色
        text = "${colors.base05}ff"; # 未选中项的文本颜色
        selection = "${colors.base07}ff"; # 选中项的背景颜色
        selection-text = "${colors.base00}ff"; # 选中项的文本颜色
        border = "${colors.base07}ff"; # 边框颜色
      };
    };
  };
  programs.niri.settings = {
    binds = {
      "Mod+D" = {
        hotkey-overlay.title = "打开搜索";
        repeat = false;
        action.spawn = [ "fuzzel" ];
      };
      "Mod+C" = {
        hotkey-overlay.title = "打开剪切板";
        repeat = false;
        action.spawn = [ "${./scripts/clip.sh}" ];
      };
      "Mod+W" = {
        hotkey-overlay.title = "打开壁纸选择器";
        repeat = false;
        action.spawn = [ "${./scripts/wallpaper.sh}" ];
      };
    };
  };

}
