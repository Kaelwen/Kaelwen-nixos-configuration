{ lib, ... }:
{
  programs.nixvim = {
    plugins = {
      bufferline.enable = true; # 缓冲区标签
    };
    keymaps = [
      {
        mode = "n";
        key = "<Tab>";
        action = "<cmd>BufferLineCycleNext<cr>";
        options = {
          desc = "进入下一个标签页";
        };
      }
      {
        mode = "n";
        key = "<S-Tab>";
        action = "<cmd>BufferLineCyclePrev<cr>";
        options = {
          desc = "进入前一个标签页";
        };
      }

      {
        mode = "n";
        key = "<leader>bd";
        # action = "<cmd>bp | bd #<cr>";
        action = "<cmd>bdelete<cr>";
        options.desc = "删除当前 buffer 并切换到上一个";
      }
      {
        mode = "n";
        key = "<leader>bo";
        action = "<cmd>BufferLineCloseOthers<cr>";
        options = {
          desc = "删除其他标签页";
        };
      }
    ];
  };
}
