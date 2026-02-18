{
  config,
  lib,
  pkgs,
  ...
}:
let
  tty = config.programs.terminal.tty;
  fileChoose = config.programs.essential.fileChoose;
in
{
  programs.niri.settings = {
    binds =
      with config.lib.niri.actions;
      let
        mod = "Mod";
      in
      {
        # 应用启动
        "${mod}+T" = {
          hotkey-overlay.title = "打开终端";
          action.spawn = [ tty ];
        };
        "${mod}+E" = {
          hotkey-overlay.title = "打开文件管理器";
          action.spawn = [
            fileChoose
          ];
        };
        XF86AudioLowerVolume = lib.mkDefault {
          allow-when-locked = true;
          action.spawn = [
            "wpctl"
            "set-volume"
            "@DEFAULT_AUDIO_SINK@"
            "0.05-"
          ];
        };
        XF86AudioMicMute = lib.mkDefault {
          allow-when-locked = true;
          action.spawn = [
            "wpctl"
            "set-mute"
            "@DEFAULT_AUDIO_SOURCE@"
            "toggle"
          ];
        };
        XF86AudioMute = lib.mkDefault {
          allow-when-locked = true;
          action.spawn = [
            "wpctl"
            "set-mute"
            "@DEFAULT_AUDIO_SINK@"
            "toggle"
          ];
        };
        XF86AudioRaiseVolume = lib.mkDefault {
          allow-when-locked = true;
          action.spawn = [
            "wpctl"
            "set-volume"
            "@DEFAULT_AUDIO_SINK@"
            "0.05+"
          ];
        };
        XF86MonBrightnessDown = lib.mkDefault {
          allow-when-locked = true;
          action.spawn = [
            (lib.getExe pkgs.brightnessctl)
            "set"
            "5%-"
          ];
        };
        XF86MonBrightnessUp = lib.mkDefault {
          allow-when-locked = true;
          action.spawn = [
            (lib.getExe pkgs.brightnessctl)
            "set"
            "5%+"
          ];
        };

        # 工作区切换
        "${mod}+0".action = focus-workspace 0;
        "${mod}+1".action = focus-workspace 1;
        "${mod}+2".action = focus-workspace 2;
        "${mod}+3".action = focus-workspace 3;
        "${mod}+4".action = focus-workspace 4;
        "${mod}+5".action = focus-workspace 5;
        "${mod}+6".action = focus-workspace 6;
        "${mod}+7".action = focus-workspace 7;
        "${mod}+8".action = focus-workspace 8;
        "${mod}+9".action = focus-workspace 9;

        "Print".action.screenshot = [ ];
        # "Alt+Print".action = screenshot-window;

        # 窗口布局控制
        "${mod}+Ctrl+C" = {
          hotkey-overlay.title = "将窗口移至中央";
          action = center-column;
        };
        "${mod}+Ctrl+F" = {
          hotkey-overlay.title = "使窗口悬浮";
          action = toggle-window-floating;
        };

        # 移动窗口（上下左右）
        "${mod}+Ctrl+K" = {
          hotkey-overlay.title = "上移窗口";
          action = move-window-up;
        };
        "${mod}+Ctrl+Up" = {
          hotkey-overlay.title = "上移窗口";
          action = move-window-up;
        };
        "${mod}+Ctrl+J" = {
          hotkey-overlay.title = "下移窗口";
          action = move-window-down;
        };
        "${mod}+Ctrl+Down" = {
          hotkey-overlay.title = "下移窗口";
          action = move-window-down;
        };
        "${mod}+Ctrl+H" = {
          hotkey-overlay.title = "左移窗口";
          action = move-column-left;
        };
        "${mod}+Ctrl+Left" = {
          hotkey-overlay.title = "左移窗口";
          action = move-column-left;
        };
        "${mod}+Ctrl+L" = {
          hotkey-overlay.title = "右移窗口";
          action = move-column-right;
        };
        "${mod}+Ctrl+Right" = {
          hotkey-overlay.title = "右移窗口";
          action = move-column-right;
        };

        # 移动窗口到工作区边缘
        "${mod}+Ctrl+End" = {
          hotkey-overlay.title = "窗口移至最右侧";
          action = move-column-to-last;
        };
        "${mod}+Ctrl+Home" = {
          hotkey-overlay.title = "窗口移至最左侧";
          action = move-column-to-first;
        };

        # 移动窗口到其他工作区
        "${mod}+Ctrl+Page_Down" = {
          hotkey-overlay.title = "窗口移至下一工作区";
          action = move-column-to-workspace-down;
        };
        "${mod}+Ctrl+Page_Up" = {
          hotkey-overlay.title = "窗口移至上一工作区";
          action = move-column-to-workspace-up;
        };

        # 窗口操作
        "${mod}+F" = {
          hotkey-overlay.title = "窗口最大化";
          action = maximize-column;
        };
        "${mod}+Q" = {
          hotkey-overlay.title = "关闭窗口";
          repeat = false;
          action = close-window;
        };
        "${mod}+R" = {
          hotkey-overlay.title = "更改窗口大小预设";
          action = switch-preset-column-width;
        };

        # 窗口焦点导航
        "${mod}+K" = {
          hotkey-overlay.title = "切换到上侧窗口";
          action = focus-window-up;
        };
        "${mod}+Up" = {
          hotkey-overlay.title = "切换到上侧窗口";
          action = focus-window-up;
        };
        "${mod}+J" = {
          hotkey-overlay.title = "切换到下侧窗口";
          action = focus-window-down;
        };
        "${mod}+Down" = {
          hotkey-overlay.title = "切换到下侧窗口";
          action = focus-window-down;
        };
        "${mod}+H" = {
          hotkey-overlay.title = "切换到左侧窗口";
          action = focus-column-left;
        };
        "${mod}+Left" = {
          hotkey-overlay.title = "切换到左侧窗口";
          action = focus-column-left;
        };
        "${mod}+L" = {
          hotkey-overlay.title = "切换到右侧窗口";
          action = focus-column-right;
        };
        "${mod}+Right" = {
          hotkey-overlay.title = "切换到右侧窗口";
          action = focus-column-right;
        };

        # 列内焦点跳转
        "${mod}+End" = {
          hotkey-overlay.title = "切换到该工作区的最后一个窗口";
          action = focus-column-last;
        };
        "${mod}+Home" = {
          hotkey-overlay.title = "切换到该工作区的第一个窗口";
          action = focus-column-first;
        };

        # 手动调整列宽
        "${mod}+Equal" = {
          hotkey-overlay.title = "增大窗口宽度";
          action = set-column-width "+5%";
        };
        "${mod}+Minus" = {
          hotkey-overlay.title = "减小窗口宽度";
          action = set-column-width "-5%";
        };

        # 工作区导航
        "${mod}+Page_Up" = {
          hotkey-overlay.title = "切换到上一个工作区";
          action = focus-workspace-up;
        };
        "${mod}+Page_Down" = {
          hotkey-overlay.title = "切换到下一个工作区";
          action = focus-workspace-down;
        };

        # 其他
        "${mod}+Escape" = {
          hotkey-overlay.title = "总览模式";
          repeat = false;
          action = toggle-overview;
        };
        "${mod}+Alt+Space" = {
          hotkey-overlay.title = "显示快捷键提示";
          action = show-hotkey-overlay;
        };

        "${mod}+Shift+0".action.move-column-to-workspace = [ 0 ];
        "${mod}+Shift+1".action.move-column-to-workspace = [ 1 ];
        "${mod}+Shift+2".action.move-column-to-workspace = [ 2 ];
        "${mod}+Shift+3".action.move-column-to-workspace = [ 3 ];
        "${mod}+Shift+4".action.move-column-to-workspace = [ 4 ];
        "${mod}+Shift+5".action.move-column-to-workspace = [ 5 ];
        "${mod}+Shift+6".action.move-column-to-workspace = [ 6 ];
        "${mod}+Shift+7".action.move-column-to-workspace = [ 7 ];
        "${mod}+Shift+8".action.move-column-to-workspace = [ 8 ];
        "${mod}+Shift+9".action.move-column-to-workspace = [ 9 ];

        # 将列移动到其他显示器
        "${mod}+Shift+Ctrl+H".action = move-column-to-monitor-left;
        "${mod}+Shift+Ctrl+J".action = move-column-to-monitor-down;
        "${mod}+Shift+Ctrl+K".action = move-column-to-monitor-up;
        "${mod}+Shift+Ctrl+L".action = move-column-to-monitor-right;
        "${mod}+Shift+Ctrl+Down".action = move-column-to-monitor-down;
        "${mod}+Shift+Ctrl+Left".action = move-column-to-monitor-left;
        "${mod}+Shift+Ctrl+Right".action = move-column-to-monitor-right;
        "${mod}+Shift+Ctrl+Up".action = move-column-to-monitor-up;

        # 切换焦点到其他显示器
        "${mod}+Shift+H".action = focus-monitor-left;
        "${mod}+Shift+J".action = focus-monitor-down;
        "${mod}+Shift+K".action = focus-monitor-up;
        "${mod}+Shift+L".action = focus-monitor-right;

        # 其他操作
        "${mod}+Shift+E" = {
          hotkey-overlay.title = "退出";
          action = quit;
        };
        "${mod}+Shift+F" = {
          hotkey-overlay.title = "窗口全屏";
          action = fullscreen-window;
        };

        # 使用方向键在显示器之间切换焦点
        "${mod}+Shift+Down" = {
          action = focus-monitor-down;
        };
        "${mod}+Shift+Left" = {
          action = focus-monitor-left;
        };
        "${mod}+Shift+Right" = {
          action = focus-monitor-right;
        };
        "${mod}+Shift+Up" = {
          action = focus-monitor-up;
        };

        # 调整窗口大小
        "${mod}+Shift+Equal" = {
          hotkey-overlay.title = "增大窗口高度";
          action = set-window-height "+5%";
        };
        "${mod}+Shift+Minus" = {
          hotkey-overlay.title = "减小窗口高度";
          action = set-window-height "-5%";
        };

        # 滚轮滚动时的操作
        "${mod}+Shift+WheelScrollDown" = {
          cooldown-ms = 150;
          action = focus-column-right;
        };
        "${mod}+Shift+WheelScrollUp" = {
          cooldown-ms = 150;
          action = focus-column-left;
        };
        "${mod}+WheelScrollDown" = {
          cooldown-ms = 150;
          action = focus-workspace-down;
        };
        "${mod}+WheelScrollLeft" = {
          cooldown-ms = 150;
          action = focus-column-left;
        };
        "${mod}+WheelScrollRight" = {
          cooldown-ms = 150;
          action = focus-column-right;
        };
        "${mod}+WheelScrollUp" = {
          cooldown-ms = 150;
          action = focus-workspace-up;
        };
      };
  };
}
