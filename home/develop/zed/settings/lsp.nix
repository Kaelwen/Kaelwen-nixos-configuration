{ pkgs, lib, ... }:
{
  programs.zed-editor.userSettings.lsp = {
    pyright = {
      binary = {
        path = "${pkgs.pyright}/bin/pyright-langserver";
        arguments = [ "--stdio" ];
      };
    };
    nixd = {
      binary = {
        path = lib.getExe pkgs.nixd;
      };
    };
    rust-analyzer = {
      binary = {
        path = lib.getExe pkgs.rust-analyzer;
      };
    };
    gopls = {
      binary = {
        path = lib.getExe pkgs.gopls;
      };
    };
    clangd = {
      binary = {
        path = "${pkgs.clang-tools}/bin/clangd";
      };
    };
    qmlls = {
      binary = {
        path = "${pkgs.qt6.qtdeclarative}/bin/qmlls";
      };
    };
    marksman = {
      binary = {
        path = lib.getExe pkgs.marksman;
      };
    };
    vue-language-server = {
      binary = {
        path = lib.getExe pkgs.vue-language-server;
        arguments = [ "--stdio" ];
      };
    };
  };
}
