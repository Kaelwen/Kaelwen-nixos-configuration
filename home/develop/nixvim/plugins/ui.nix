{ ... }:
{
  programs.nixvim.plugins = {
    bufferline.enable = true; # 缓冲区标签
    lualine.enable = true; # 状态栏
    treesitter = {
      # 语法高亮
      enable = true;
    };

  };
}
