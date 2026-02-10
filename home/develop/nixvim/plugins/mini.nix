{ ... }:
{
  programs.nixvim = {
    plugins.mini = {
      enable = true;
      modules = {
        icons.enable = true; # 极简图标
        surround.enable = true; # 文本包围 (ysiw" -> `""`)
        bufremove.enable = true; # 快速删除缓冲区
        indentscope.enable = true; # 缩进可视化
        pairs.enable = true; # 自动括号
        notify.enable = true; # 美化通知

        files.enable = true;
        pick.enable = true;
        diff.enable = true;
        jump.enable = true;

        # fuzzy.enable = true;
        # 切换tab的命令：]+b
        tabline.enable = true;
        comment.enable = true;
      };
    };
    keymaps = [
      {
        mode = "n";
        key = "<leader>e";
        action = ":lua MiniFiles.open()<cr>";
        options = {
          desc = "打开文件树";
        };
      }
      {
        mode = "n";
        key = "<leader>f";
        action = ":Pick files<cr>";
        options = {
          desc = "打开文件选择器";
        };
      }
      {
        mode = "n";
        key = "<leader>h";
        action = ":Pick help<CR>";
        options = {
          desc = "open help picker";
        };
      }
      {
        mode = "n";
        key = "<leader>b";
        action = ":Pick buffers<CR>";
        options = {
          desc = "open buffer picker";
        };
      }
    ];
  };
}
