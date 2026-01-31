{ ... }:
{
  programs.nixvim = {
    plugins = {
      nvim-tree = {
        enable = true; # 文件树
        autoClose = true;
        # openOnSetup = true;
        openOnSetupFile = true;
        # settings.git.enable = true; # 启用 Git 集成
      };
    };
    keymaps = [
      # 快捷键 1: 切换文件树
      {
        mode = "n";
        key = "<leader>e"; # 按下 `空格 + e`
        action = "<cmd>NvimTreeToggle<cr>";
        options = {
          noremap = true;
          silent = true;
          desc = "唤出文件树";
        };
      }
      # 快捷键 2: 在文件树中定位当前文件
      {
        mode = "n";
        key = "<leader>o"; # 按下 `空格 + o` (o for 'open')
        action = "<cmd>NvimTreeFindFile<cr>";
        options = {
          noremap = true;
          silent = true;
          desc = "选择文件树";
        };
      }
    ];
  };
}
