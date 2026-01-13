{ ... }:
{
  programs.nixvim.plugins.lsp = {
    enable = true;
    inlayHints = true;
    servers = {
      rust_analyzer = {
        enable = true;
        installCargo = true;
        installRustc = true;
      };
      pyright.enable = true;
      clangd.enable = true;
      nixd.enable = true;
      gopls.enable = true;
      dockerls.enable = true;
      cssls.enable = true;
      marksman.enable = true;
      jsonls.enable = true;
      ts_ls.enable = true;
    };
  };
}
