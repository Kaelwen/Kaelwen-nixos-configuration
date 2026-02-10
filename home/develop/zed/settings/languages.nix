{ lib, pkgs, ... }:
{
  programs.zed-editor.userSettings = {
    languages = {
      Nix = {
        language_servers = [ "nixd" ];
        format_on_save = "on";
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

        format_on_save = "on";
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

        format_on_save = "on";
        formatter = {
          external = {
            command = lib.getExe pkgs.rustfmt;
          };
        };
      };
      C = {
        language_servers = [ "clangd" ];
        format_on_save = "on";
        formatter = {
          external.command = "${pkgs.clang-tools}/bin/clang-format";
        };
      };
      "C++" = {
        language_servers = [ "clangd" ];
        format_on_save = "on";
        formatter = {
          external.command = "${pkgs.clang-tools}/bin/clang-format";
        };
      };
      Go = {
        language_servers = [ "gopls" ];
        format_on_save = "on";
        formatter = {
          external = {
            command = "${pkgs.go}/bin/gofmt";
          };
        };
      };
      QML = {
        language_servers = [ "qmlls" ];
        format_on_save = "on";
        formatter = {
          external = {
            command = "${pkgs.qt6.qtdeclarative}/bin/qmlformat";
            arguments = [
              "{buffer_path}"
            ];
          };
        };
      };
      Markdown = {
        format_on_save = "on";
      };
      "Vue.js" = {
        format_on_save = "on";
        language_servers = [ "vue-language-server" ];
        formatter = {
          external = {
            command = "${pkgs.prettier}/bin/prettier";
            arguments = [
              "--stdin-filepath"
              "{buffer_path}"
            ];
          };
        };
      };
    };
  };
}
