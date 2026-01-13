{ inputs, config, ... }:
{
  imports = [
    inputs.nixvim.homeModules.nixvim
    ./keymaps.nix
    # ./lsp.nix
    ./plugins/0-default.nix
  ];
  programs.nixvim = {
    enable = true;
    defaultEditor = true;
    vimdiffAlias = true;
    wrapRc = false;
    colorschemes.catppuccin.enable = true;
    extraConfig = ''
      colorscheme catppuccin
    '';
    opts = {
      number = true;
      relativenumber = false;
      numberwidth = 3;

      expandtab = true;
      tabstop = 4;
      shiftwidth = 4;
      softtabstop = 4;
    };
    highlightOverride = with config.lib.stylix.colors.withHashtag; {
      CursorLineNr = {
        bg = base01;
        fg = base06;
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
