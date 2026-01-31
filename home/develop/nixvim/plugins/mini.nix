{ ... }:
{
  programs.nixvim.plugins = {
    mini = {
      enable = true;
      modules = {
        # icons.enable = true; # 极简图标
        # surround.enable = true; # 文本包围 (ysiw" -> `""`)
        # bufremove.enable = true; # 快速删除缓冲区
        indentscope.enable = true; # 缩进可视化
        # pairs.enable = true; # 自动括号
        notify.enable = true; # 美化通知
      };
    };
  };
}
