{ ... }:
{
  programs.nixvim.plugins = {
    bufferline.enable = true; # 缓冲区标签
    lualine.enable = true; # 状态栏
    luasnip.enable = true; # 代码片段
    web-devicons.enable = true; # 文件图标

    transparent = {
      enable = true;
      settings = {
        # 包含行号相关的所有高亮组
        extra_groups = [
          "LineNr"
          "LineNrAbove"
          "LineNrBelow"
          "CursorLineNr"
          "SignColumn"
        ];
      };
    };
  };
}
