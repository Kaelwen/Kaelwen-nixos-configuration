{ ... }:
{

  programs.nixvim = {
    plugins.telescope = {
      enable = true;
      extensions = {
        fzf-native.enable = true;
        file-browser.enable = true;
        live-grep-args.enable = true;
      };
    };

    keymaps = [
      {
        action = "<CMD>Telescope projects layout_config={height=0.6,width=0.6}<CR>";
        key = "<leader>fp";
        options = {
          silent = true;
          desc = "切换项目";
        };
      }
      {
        action = "<CMD>Telescope find_files<CR>";
        key = "<leader>ff";
        options = {
          silent = true;
          desc = "查找文件";
        };
      }
      {
        action = "<CMD>Telescope grep_string theme=ivy<CR>";
        key = "<leader>fs";
        options = {
          silent = true;
          desc = "字符快搜";
        };
      }
      {
        action = "<CMD>Telescope live_grep theme=ivy<CR>";
        key = "<leader>fg";
        options = {
          silent = true;
          desc = "全局搜索";
        };
      }
      # {
      #   action = "<CMD>Telescope buffers<CR>";
      #   key = "<leader>b";
      #   options = {
      #     silent = true;
      #     desc = "查看缓冲区";
      #   };
      # }
      {
        action = "<CMD>Telescope oldfiles theme=dropdown<CR>";
        key = "<leader>fo";
        options = {
          silent = true;
          desc = "历史文件";
        };
      }
      {
        action = "<CMD>Telescope live_grep_args theme=ivy layout_config={height=0.4}<CR>";
        key = "<leader>fr";
        options = {
          silent = true;
          desc = "高级搜索";
        };
      }
      # FIXED: 已修复错误，禁用性能提高参数 performance.byteCompileLua.plugins 即可修复该错误
      {
        action = "<CMD>Telescope keymaps layout_config={width=0.8}<CR>";
        key = "<leader>fk";
        options = {
          silent = true;
          desc = "快捷键查询";
        };
      }
      {
        action = "<CMD>Telescope help_tags theme=ivy layout_config={height=0.4}<CR>";
        key = "<leader>H";
        options = {
          silent = true;
          desc = "帮助查询";
        };
      }
    ];

  };
}
