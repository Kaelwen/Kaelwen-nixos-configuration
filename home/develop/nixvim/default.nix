{ inputs, ... }:
{
  imports = [
    inputs.nixvim.homeModules.nixvim
    ./keymaps.nix
    ./lsp.nix
    ./plugins/0-default.nix
  ];
  programs.nixvim = {
    enable = true;
    defaultEditor = true;
    vimdiffAlias = true;
    wrapRc = false;
    opts.number = true;
    # 启用相对行号（常用于 Vim 风格高效移动）
    opts.relativenumber = false;
    opts.numberwidth = 3;

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
