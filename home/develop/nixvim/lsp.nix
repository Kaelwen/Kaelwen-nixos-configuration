{ lib, pkgs, ... }:

{
  programs.nixvim = {
    programs.nixvim.plugins = {
      lsp.enable = true; # 启用 LSP 补全
    };
    lsp = {
      inlayHints.enable = true;
      servers = {
        rust_analyzer.enable = true;
        pyright.enable = true;
        clangd.enable = true;
        nixd.enable = true;
        tsserver.enable = true;
        gopls.enable = true;
      };
    };
    plugins.conform-nvim = {
      enable = true;
      settings = {
        format_on_save = {
          lspFallback = true;
          timeoutMs = 500;
        };
        notify_on_error = true;

        formatters_by_ft = {
          c = [ "clang-format" ];
          cpp = [ "clang-format" ];
          rust = [ "rustfmt" ];
          nix = [ "nixfmt" ];
          python = [ "ruff" ];
          go = [ "gopls" ];
        };
        formatters = {
          nixfmt.command = lib.getExe pkgs.nixfmt-rfc-style;
          ruff = {
            command = lib.getExe pkgs.ruff;
            args = [
              "format"
              "-"
            ];
          };
        };
      };
    };
  };
}
