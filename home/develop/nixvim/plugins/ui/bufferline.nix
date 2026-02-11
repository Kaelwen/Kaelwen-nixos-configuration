{ ... }:
{
  programs.nixvim = {
    plugins = {
      bufferline.enable = true; # 缓冲区标签
    };
    keymaps = [
      {
        mode = "n";
        key = "]b";
        action = "<cmd>BufferLineCycleNext<cr>";
        options = {
          desc = "切换到下一个缓冲区";
        };
      }

      {
        mode = "n";
        key = "[b";
        action = "<cmd>BufferLineCyclePrev<cr>";
        options = {
          desc = "切换到上一个缓冲区";
        };
      }

      {
        mode = "n";
        key = "<leader>bb";
        action = "<CMD>e #<CR>";
        options = {
          desc = "快速切换缓冲区";
        };
      }

      {
        mode = "n";
        key = "<leader>bf";
        action = "<cmd>BufferLinePick<cr>";
        options = {
          desc = "查询并跳转缓冲区";
        };
      }

      {
        mode = "n";
        key = "<leader>bd";
        action = "<cmd>bdelete<cr>";
        options = {
          desc = "删除缓冲区";
        };
      }

      {
        mode = "n";
        key = "<leader>bo";
        action = "<cmd>BufferLineCloseOthers<cr>";
        options = {
          desc = "删除其他缓冲区";
        };
      }

      {
        mode = "n";
        key = "<leader>bp";
        action = "<cmd>BufferLineTogglePin<cr>";
        options = {
          desc = "切换缓冲区固定状态";
        };
      }

      {
        mode = "n";
        key = "<leader>bP";
        action = "<Cmd>BufferLineGroupClose ungrouped<CR>";
        options = {
          desc = "删除未固定的缓冲区";
        };
      }

    ];
  };
}
