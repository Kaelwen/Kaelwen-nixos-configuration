{ pkgs, lib, ... }:
{
  programs.zed-editor.userSettings.lsp = {
    pyright = {
      binary = {
        path = "${pkgs.pyright}/bin/pyright-langserver";
        path_lookup = true;
      };
    };

    nixd = {
      binary = {
        path = lib.getExe pkgs.nixd;
        path_lookup = true;
      };
    };

    rust-analyzer = {
      binary = {
        path = lib.getExe pkgs.rust-analyzer;
        path_lookup = true;
      };
    };
    gopls = {
      binary = {
        path = lib.getExe pkgs.gopls;
        path_lookup = true;
      };
    };
  };
}
