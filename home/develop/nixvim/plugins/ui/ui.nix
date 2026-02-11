{ ... }:
{
  programs.nixvim.plugins = {

    lualine.enable = true; # 状态栏
    luasnip.enable = true; # 代码片段
    web-devicons.enable = true; # 文件图标

    # scrollview.enable = true;
    # cursorline.enable = true;
    # cursorline.settings.cursorword.enable = true;
    fidget.enable = true;
    # indent-blankline.enable = true;

    # navbuddy.enable = true;
    # smartcolumn.enable = true;
    # fastaction.enable = true;
    # colorizer = {
    #   enable = true;
    #   settings.user_default_options = {
    #     mode = "virtualtext";
    #     css = true;
    #     css_fn = true;
    #     names = false;
    #     virtualtext = "■";
    #     virtualtext_inline = true;
    #     virtualtext_mode = "foreground";
    #   };
    # };
  };
}
