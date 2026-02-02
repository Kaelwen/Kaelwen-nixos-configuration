{
  programs.nixvim = {
    plugins.lazygit = {
      enable = true;
    };
    keymaps = [
      {
        mode = "n"; # normal 模式
        key = "<leader>gg";
        action = "<cmd>LazyGit<cr>";
        options = {
          desc = "打开LazyGit";
        };
      }
    ];
  };
}
