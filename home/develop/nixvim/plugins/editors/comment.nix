{
  programs.nixvim = {
    plugins = {
      comment = {
        enable = true;
        settings = {
          opleader = {
            # block = "gb";
            line = " c";
          };
          toggler = {
            # block = "gbc";
            line = " c";
          };
        };
      };
    };
    # keymaps = [
    #   # Normal 模式：<leader>c → toggle 当前行注释
    #   {
    #     mode = "n";
    #     key = "<leader>c";
    #     action = "<cmd>lua require('Comment.api').toggle.linewise.current()<CR>";
    #     options.desc = "Toggle line comment";
    #   }
    #
    #   # Visual 模式：<leader>c → toggle 选中区域注释
    #   {
    #     mode = "v";
    #     key = "<leader>c";
    #     action = "<cmd>lua require('Comment.api').toggle.linewise(vim.fn.visualmode())<CR>";
    #     options.desc = "Toggle visual comment";
    #   }
    # ];
  };

}
