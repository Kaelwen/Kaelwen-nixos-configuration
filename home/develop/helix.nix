{
  pkgs,
  lib,
  ...
}:

{
  home.packages = with pkgs; [
    nixd
    llvmPackages_21.clang-tools
    lldb
  ];

  programs.helix = {
    enable = true;
    settings = {
      editor.cursor-shape = {
        normal = "block";
        insert = "bar";
        select = "underline";
      };
    };
    languages = {
      language = [
        {
          name = "nix";
          auto-format = true;
          formatter.command = lib.getExe pkgs.nixfmt-rfc-style;
          language-servers = [ "nixd" ];
        }
        {
          name = "c";
          auto-format = true;
          formatter.command = "clang-format";
          language-servers = [ "clangd" ];
        }
        {
          name = "cpp";
          auto-format = true;
          formatter.command = "clang-format";
          language-servers = [ "clangd" ];
        }
        {
          name = "python";
          auto-format = true;
          formatter = {
            command = lib.getExe pkgs.ruff;
            args = [
              "format"
              "-"
            ];
          };
          language-servers = [ "pylsp" ];
        }
        {
          name = "rust";
          auto-format = true;
          formatter.command = "rustfmt";
          language-servers = [ "rust-analyzer" ];
        }
        {
          name = "go";
          auto-format = true;
          language-servers = [ "gopls" ];
        }
        {
          name = "javascript";
          auto-format = true;
          language-servers = [ "typescript-language-server" ];
        }
        {
          name = "vue";
          language-servers = [ "vuels" ];
        }
        {
          name = "dockerfile";
          auto-format = true;
          language-servers = [ "docker-langserver" ];
        }
        {
          name = "docker-compose";
          language-servers = [ "docker-compose-langserver" ];
        }
        {
          name = "json";
          auto-format = true;
          language-servers = [ "vscode-json-languageserver" ];
        }
        {
          name = "jsonc";
          auto-format = true;
          language-servers = [ "vscode-json-languageserver" ];
        }

        {
          name = "kdl";
          auto-format = true;
          formatter = {
            command = lib.getExe pkgs.kdlfmt;
            args = [
              "format"
              "-"
            ];
          };
        }
        {
          name = "yaml";
          language-servers = [ "yaml-language-server" ];
        }
      ];
      language-server = {
        nixd.command = lib.getExe pkgs.nixd;
        pylsp.command = lib.getExe pkgs.python313Packages.python-lsp-server;
        gopls.command = lib.getExe pkgs.gopls;
        typescript-language-server.command = lib.getExe pkgs.typescript-language-server;
        tailwindcss-language-server.command = lib.getExe pkgs.tailwindcss-language-server;
        rust-analyzer.command = lib.getExe pkgs.rust-analyzer;
        vuels.command = lib.getExe pkgs.vue-language-server;
        vscode-json-languageserver.command = lib.getExe pkgs.vscode-json-languageserver;
        yaml-language-server.command = lib.getExe pkgs.yaml-language-server;
        docker-langserver.command = lib.getExe pkgs.dockerfile-language-server;
        docker-compose-langserver.command = lib.getExe pkgs.docker-compose-language-service;
      };
    };
  };
}
