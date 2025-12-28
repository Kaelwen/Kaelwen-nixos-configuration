{ ... }:
{
  programs.nixvim.plugins = {
    which-key = {
      enable = true;
      settings = {
        delay = 0;
        expand = 1;
        spec = [
          {
            __unkeyed-1 = "<leader>b";
            group = "标签页操作";
            icon = "󰓩 ";
          }
        ];
      };
    };
  };
}
