{ lib, pkgs, ... }:
{
  programs.zed-editor.userSettings.languages = {
    Nix = {
      language_servers = [ "nixd" ];
      formatter = {
        external = {
          arguments = [
            "--quiet"
            "--"
          ];
          command = lib.getExe pkgs.nixfmt;
        };
      };
    };
    Python = {
      language_servers = [ "pyright" ];
      formatter.external = {
        command = lib.getExe pkgs.ruff;
        arguments = [
          "format"
          "-"
        ];
      };
    };
    Rust = {
      language_servers = [ "rust-analyzer" ];
      formatter = {
        external = {
          command = lib.getExe pkgs.rustfmt;
        };
      };
    };
    C = {
      language_servers = [ "clangd" ];
      formatter = {
        external.command = "${pkgs.clang-tools}/bin/clang-format";
      };
    };
    Cpp = {
      language_servers = [ "clangd" ];
      formatter = {
        external.command = "${pkgs.clang-tools}/bin/clang-format";
      };
    };
    Go = {
      language_servers = [ "gopls" ];
      formatter = {
        external = {
          command = "${pkgs.go}/bin/gofmt";
        };
      };
    };
    Qml = {
      language_servers = [ "qmlls" ];
      formatter = {
        external = {
          command = "${pkgs.qt6.qtdeclarative}/bin/qmlformat";
        };
      };
    };
    Markdown = {
      format_on_save = "on";
    };
    Vue = {
      language_servers = [ "vue-language-serve" ];
      formatter = {
        command = "${pkgs.prettier}/bin/prettier";
      };
    };
  };
}
