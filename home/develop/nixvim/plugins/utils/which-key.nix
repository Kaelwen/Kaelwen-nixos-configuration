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
        ];
      };
    };
  };
}
