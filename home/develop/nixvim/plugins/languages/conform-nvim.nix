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
        go = [ "gofmt" ];
        qml = [ "qmlformat" ];
        javascript = [ "prettier" ];
        typescript = [ "prettier" ];
        markdown = [ "prettier" ];
        json = [ "prettier" ];
        yaml = [ "prettier" ];
        toml = [ "prettier" ];
        html = [ "prettier" ];
        css = [ "prettier" ];
        vue = [ "prettier" ];
        kdl = [ "kdlfmt" ];
        sh = [ "shfmt" ];
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
        prettier.command = "${pkgs.prettier}/bin/prettier";
        kdlfmt.command = "${pkgs.kdlfmt}/bin/kdlfmt";
        qmlformat.command = "${pkgs.qt6.qtdeclarative}/bin/qmlformat";
        shfmt.command = "${pkgs.shfmt}/bin/shfmt";
      };
    };
  };
}
