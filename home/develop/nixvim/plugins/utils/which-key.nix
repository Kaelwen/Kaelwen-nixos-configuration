{ ... }:
{
  programs.nixvim.plugins = {
    which-key = {
      enable = true;
      settings = {
        delay = 0;
        expand = 1;
        preset = "helix";

        spec = [
          {
            __unkeyed-1 = "<leader>b";
            group = "标签页操作";
            icon = "󰓩 ";
          }
          {
            __unkeyed-1 = "<leader>r";
            group = "ssh连接";
            icon = "אַ";
          }
          {
            __unkeyed-1 = "<leader>f";
            group = "文件查找相关";
          }
          {
            __unkeyed-1 = "<leader>l";
            group = "lsp相关";
          }
        ];
      };
    };
  };
}
