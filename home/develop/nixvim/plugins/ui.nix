{ ... }:
{
  programs.nixvim.plugins = {
    bufferline.enable = true; # 缓冲区标签
    lualine.enable = true; # 状态栏
    nvim-tree = {
      enable = true; # 文件树
      settings.git.enable = true; # 启用 Git 集成
    };
    treesitter = {
      # 语法高亮
      enable = true;
    };

  };
}
