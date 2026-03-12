{ ... }:
{
  programs.nixvim = {
    plugins.mini = {
      enable = true;
      modules = {
        # 编辑增强
        surround.enable = true; # 文本包围
        pairs.enable = true; # 自动括
        notify.enable = true; # 通知（替代 fidget）

      };
    };

  };
}
