{ ... }:
{
  programs.nixvim = {
    plugins.mini = {
      enable = true;
      modules = {
        icons.enable = true; # 图标（替代 web-devicons）
        basics.enable = true; # 基础设置
        bracketed.enable = true; # 快速跳转 ]b ]q ]f 等

        # 编辑增强
        surround.enable = true; # 文本包围
        pairs.enable = true; # 自动括号
        ai.enable = true; # 智能 text object (ci" 更强大)
        trailspace.enable = true; # 尾随空格高亮

        # 界面
        tabline.enable = true; # 标签栏（替代 bufferline）
        statusline.enable = true; # 状态栏（替代 lualine）
        notify.enable = true; # 通知（替代 fidget）
        starter.enable = true; # 启动界面（替代 dashboard）
        # hipatterns.enable = true; # 高亮颜色、TODO 等

        # 文件操作
        files.enable = true; # 文件树
        bufremove.enable = true; # 缓冲区管理
        sessions.enable = true; # 会话保存/恢复

        # 搜索和跳转
        pick.enable = true; # 模糊搜索（替代 telescope）
        fuzzy.enable = true; # 模糊匹配算法
        jump.enable = true; # 快速跳转

        # 其他
        diff.enable = true; # diff 视图
        indentscope.enable = true; # 缩进可视化
        comment.enable = true; # 注释
        misc.enable = true; # 杂项工具
      };
    };
    keymaps = [
      {
        mode = "n";
        key = "<leader>e";
        action = "<cmd>lua MiniFiles.open()<cr>";
        options.desc = "文件树";
      }
      {
        mode = "n";
        key = "<leader>f";
        action = "<cmd>lua MiniPick.builtin.files()<cr>";
        options.desc = "查找文件";
      }
      {
        mode = "n";
        key = "<leader>b";
        action = "<cmd>lua MiniPick.builtin.buffers()<cr>";
        options.desc = "缓冲区列表";
      }
      {
        mode = "n";
        key = "<leader>h";
        action = "<cmd>lua MiniPick.builtin.help()<cr>";
        options.desc = "帮助文档";
      }
      {
        mode = "n";
        key = "<leader>g";
        action = "<cmd>lua MiniPick.builtin.grep_live()<cr>";
        options.desc = "全文搜索";
      }
      # {
      #   mode = "n";
      #   key = "<leader>/";
      #   action = "<cmd>lua MiniPick.builtin.grep_live()<cr>";
      #   options.desc = "全文搜索";
      # }
    ];
  };
}
