{ ... }:
{
  programs.nixvim = {
    globals = {
      mapleader = " "; # 映射leader键为空格
    };
    keymaps = [
      {
        mode = "n";
        key = "<C-s>";
        action = "<cmd>w<cr>";
        options = {
          noremap = true;
          silent = true;
          desc = "保存文本";
        };
      }
    ];
  };
}
