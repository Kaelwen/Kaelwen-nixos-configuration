{ pkgs, ... }:
{
  programs.nixvim.plugins.conform-nvim = {
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
        nixfmt.command = "${pkgs.nixfmt}/bin/nixfmt";
        clang-format.command = "${pkgs.clang-tools}/bin/clang-format";
        rustfmt.command = "${pkgs.rustfmt}/bin/rustfmt";
        ruff = {
          command = "${pkgs.ruff}/bin/ruff";
          args = [
            "format"
            "-"
          ];
        };
      };
    };
  };

}
