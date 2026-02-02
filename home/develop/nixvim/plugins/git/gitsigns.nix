{
  programs.nixvim.plugins.gitsigns = {
    enable = true;
    # plugins.gitsigns.lazyLoad = {
    #   enable = true;
    #   settings = {
    #     event = [ "User LazyFile" ];
    #   };
    # };
    settings = {
      signs = {
        add = {
          text = "│";
        };
        change = {
          text = "│";
        };
        changedelete = {
          text = "~";
        };
        delete = {
          text = "_";
        };
        topdelete = {
          text = "‾";
        };
        untracked = {
          text = "┆";
        };
      };

      current_line_blame = true; # 默认不在当前行显示 Git blame 信息，可以通过快捷键切换
      current_line_blame_opts = {
        virt_text = true; # 使用虚拟文本显示 blame 信息
        virt_text_pos = "eol"; # 在行尾显示 blame 信息 ('eol' | 'overlay' | 'right_align')
        delay = 500; # 鼠标悬停显示 blame 信息的延迟（毫秒）
        ignore_whitespace = false;
        virt_text_priority = 100;
        use_focus = true;
      };
      preview_config = {
        # 预览 Hunk 时的浮动窗口配置
        style = "minimal";
        relative = "cursor";
        row = 0;
        col = 1;
      };
    };
  };
}
