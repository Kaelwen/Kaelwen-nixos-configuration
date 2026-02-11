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
          # desc = "保存文本";
        };
      }
      # {
      #   mode = "n";
      #   key = "<leader>c";
      #   action = "gcc";
      #   options = {
      #     desc = "注释";
      #   };
      # }
      # {
      #   mode = "v";
      #   key = "<leader>c";
      #   action = "gc";
      #
      #   options = {
      #     desc = "注释";
      #   };
      # }
      # {
      #   mode = "t";
      #   key = "<Esc>";
      #   action = "<C-\\><C-n>"; # 退出终端模式
      #   options = {
      #     noremap = true;
      #     silent = true;
      #     desc = "退出终端模式";
      #   };
      # }
    ];
  };
}
