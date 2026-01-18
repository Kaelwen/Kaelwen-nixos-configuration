{ ... }:
{
  programs.nixvim = {
    plugins = {
      opencode.enable = true;
    };

    keymaps = [
      # OpenCode 主要功能快捷键
      {
        mode = "n";
        key = "<leader>cc";
        action = "<cmd>lua require('opencode').toggle()<cr>";
        options = {
          desc = "打开OpenCode";
          silent = true;
        };
      }
      {
        mode = "n";
        key = "<leader>ca";
        action = "<cmd>lua require('opencode').ask()<cr>";
        options = {
          desc = "询问OpenCode";
          silent = true;
        };
      }
      {
        mode = "v";
        key = "<leader>ca";
        action = "<cmd>lua require('opencode').ask()<cr>";
        options = {
          desc = "询问OpenCode（可视模式）";
          silent = true;
        };
      }
      {
        mode = "n";
        key = "<leader>ce";
        action = "<cmd>lua require('opencode').explain()<cr>";
        options = {
          desc = "解释代码";
          silent = true;
        };
      }
      {
        mode = "v";
        key = "<leader>ce";
        action = "<cmd>lua require('opencode').explain()<cr>";
        options = {
          desc = "解释代码（可视模式）";
          silent = true;
        };
      }
      {
        mode = "n";
        key = "<leader>cr";
        action = "<cmd>lua require('opencode').refactor()<cr>";
        options = {
          desc = "重构代码";
          silent = true;
        };
      }
      {
        mode = "v";
        key = "<leader>cr";
        action = "<cmd>lua require('opencode').refactor()<cr>";
        options = {
          desc = "重构代码（可视模式）";
          silent = true;
        };
      }
      {
        mode = "n";
        key = "<leader>cd";
        action = "<cmd>lua require('opencode').debug()<cr>";
        options = {
          desc = "调试代码";
          silent = true;
        };
      }
      {
        mode = "n";
        key = "<leader>ct";
        action = "<cmd>lua require('opencode').test()<cr>";
        options = {
          desc = "生成测试";
          silent = true;
        };
      }
      {
        mode = "v";
        key = "<leader>ct";
        action = "<cmd>lua require('opencode').test()<cr>";
        options = {
          desc = "生成测试（可视模式）";
          silent = true;
        };
      }
      {
        mode = "n";
        key = "<leader>cq";
        action = "<cmd>lua require('opencode').quick()<cr>";
        options = {
          desc = "快速操作";
          silent = true;
        };
      }
      {
        mode = "i";
        key = "<C-g>";
        action = "<cmd>lua require('opencode').complete()<cr>";
        options = {
          desc = "代码补全";
          silent = true;
        };
      }
    ];
  };
}
