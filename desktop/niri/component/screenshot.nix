{ pkgs, ... }:
{
  home.packages = with pkgs; [
    grim
    slurp
    swappy
  ];
  xdg.configFile."myscripts/screenshot.sh" = {
    executable = true;
    text =
      #sh
      ''
        SCREENSHOT_DIR="$HOME/Pictures/Screenshots"
        mkdir -p "$SCREENSHOT_DIR"
        # 生成时间戳
        TIMESTAMP=$(date +%Y%m%d_%H%M%S)
        # 定义截图文件路径
        FILE="$SCREENSHOT_DIR/screenshot_$TIMESTAMP.png"
        # 判断截图模式
        if [ "$1" == "full" ]; then
            MODE="全屏截图"
            # 使用 grim 进行全屏截图
            grim "$FILE"
        else
            MODE="区域截图"
            # 使用 slurp 选择截图区域并使用 grim 进行截图
            grim -g "$(slurp)" "$FILE"
        fi
        # 检查截图是否成功
        if [ $? -eq 0 ]; then
            # 复制截图到剪贴板
            wl-copy < "$FILE"
            # 发送截图完成通知
            notify-send "截图完成" "已保存至: $FILE 并已复制到剪贴板"
        else
            notify-send "截图失败" "未能成功捕获屏幕"
        fi
        exit 0
      '';
  };
  programs.niri.settings.binds = {
    "Print".action.spawn = "~/.config/myscripts/screenshot.sh";
  };
}
