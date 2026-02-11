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
        key = "<leader>a";
        action = "<cmd>lua require('opencode').toggle()<cr>";
        options = {
          desc = "打开OpenCode";
          silent = true;
        };
      }
    ];
  };
}
