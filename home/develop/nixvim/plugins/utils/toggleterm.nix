# 终端
{ ... }:
{
  programs.nixvim = {
    plugins = {
      toggleterm = {
        enable = true;
        settings = {
          direction = "float";
          float_opts = {
            winblend = 0;
          };
        };
      };
    };
    keymaps = [
      {
        mode = "n";
        key = "<C-`>"; # 按下 `空格 + ``
        action = "<cmd>ToggleTerm<cr>";
        options = {
          noremap = true;
          silent = true;
          desc = "打开终端";
        };
      }
      # Terminal 模式：从终端返回 Normal 模式
      {
        mode = "t";
        key = "<C-`>";
        action = "<C-\\><C-n>"; # 先退出 Terminal 模式，回到 Normal 模式
        options = {
          noremap = true;
          silent = true;
          desc = "从终端返回编辑区";
        };
      }
    ];
  };
}
