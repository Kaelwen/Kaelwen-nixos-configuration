{ inputs, config, ... }:

{
  imports = [
    inputs.nixvim.homeModules.nixvim
    ./keymaps.nix

    ./plugins

  ];
  programs.nixvim = {
    enableNixpkgsReleaseCheck = false;
    enable = true;
    defaultEditor = true;
    vimdiffAlias = true;
    wrapRc = false;
    # colorschemes.catppuccin.enable = true;
    # extraConfig = ''
    #   colorscheme catppuccin
    # '';
    opts = {
      number = true;
      relativenumber = false;
      numberwidth = 3;
      expandtab = true;
      tabstop = 2;
      shiftwidth = 4;
      softtabstop = 4;
    };
    highlightOverride = with config.lib.stylix.colors.withHashtag; {
      CursorLineNr = {
        bg = "none";
        fg = base06;
      };
      LineNr = {
        bg = "none";
      };
      Comment.italic = true;
      Comment.fg = base04;
      Boolean.italic = true;
      Boolean.fg = base0E;
      String.italic = true;
      String.fg = base0B;
      StatusLine.bg = base00;
    };
    clipboard = {
      # 剪贴板
      providers = {
        # 剪贴板提供程序
        wl-copy.enable = true;
        xclip.enable = true;
      };
      register = "unnamedplus"; # 剪贴板寄存器
    };
  };
}
