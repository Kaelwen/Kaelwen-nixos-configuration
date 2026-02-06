{ pkgs, lib, ... }:
{

  lsp = {
    pyright = {
      binary = {
        path = "${pkgs.pyright}/bin/pyright-langserver";
        path_lookup = true;
      };
    };

    nix = {
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
  };

}
