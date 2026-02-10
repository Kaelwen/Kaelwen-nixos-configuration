{
  pkgs,
  lib,
  ...
}:

{
  home.packages = with pkgs; [
    lldb
  ];

  programs.helix = {
    enable = true;
    settings = {
      editor = {
        cursor-shape = {
          normal = "block";
          insert = "bar";
          select = "underline";
        };
        lsp = {
          display-inlay-hints = true;
          display-messages = true;
        };
        file-picker = {
          hidden = false;
          ignore = false;
        };
        auto-save = {
          focus-lost = true;
          after-delay.enable = true;
        };
        statusline = {
          left = [
            "mode"
            "spinner"
          ];
          center = [ "file-name" ];
          right = [
            "diagnostics"
            "selections"
            "position"
            "file-encoding"
            "file-line-ending"
            "file-type"
          ];
          separator = "|";
        };
        # line-number = "relative";
        # cursorline = true;
        indent-guides = {
          character = "┊";
          render = true;
          skip-levels = 1;
        };
        bufferline = "always";
        completion-trigger-len = 1;
        color-modes = true;
        gutters = [
          "diff"
          "diagnostics"
          "line-numbers"
          "spacer"
        ];
      };
    };
    languages = {
      language = [
        {
          name = "nix";
          auto-format = true;
          formatter.command = lib.getExe pkgs.nixfmt;
          language-servers = [ "nixd" ];
        }
        {
          name = "c";
          auto-format = true;
          formatter.command = "${pkgs.clang-tools}/bin/clang-format";
          language-servers = [ "clangd" ];
        }
        {
          name = "cpp";
          auto-format = true;
          formatter.command = "${pkgs.clang-tools}/bin/clang-format";
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
          language-servers = [ "pyright" ];
        }
        {
          name = "rust";
          auto-format = true;
          formatter.command = "${pkgs.rustfmt}/bin/rustfmt";
          language-servers = [ "rust-analyzer" ];
        }
        {
          name = "go";
          auto-format = true;
          formatter.command = "${pkgs.go}/bin/gofmt";
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
          name = "qml";
          language-servers = [ "qmlls" ];
          auto-format = true;
          formatter = {
            command = "${pkgs.qt6.qtdeclarative}/bin/qmlformat";
            args = [ "-" ];
          };
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
        # {
        #   name = "markdown";
        #   language-servers = [ "markman" ];
        #   formatter = {
        #     command = lib.getExe pkgs.prettier;
        #     args = [ "--write" ];
        #   };
        # }
      ];
      language-server = {
        nixd = {
          command = lib.getExe pkgs.nixd;
        };
        pyright = {
          command = "${pkgs.pyright}/bin/pyright-langserver";
          args = [ "--stdio" ];
        };
        clangd.command = "${pkgs.clang-tools}/bin/clangd";
        gopls.command = lib.getExe pkgs.gopls;
        typescript-language-server.command = lib.getExe pkgs.typescript-language-server;
        tailwindcss-language-server.command = lib.getExe pkgs.tailwindcss-language-server;
        rust-analyzer.command = lib.getExe pkgs.rust-analyzer;
        vuels = {
          command = lib.getExe pkgs.vue-language-server;
          args = [ "--stdio" ];
        };
        qmlls.command = "${pkgs.qt6.qtdeclarative}/bin/qmlls";
        vscode-json-languageserver.command = lib.getExe pkgs.vscode-json-languageserver;
        yaml-language-server.command = lib.getExe pkgs.yaml-language-server;
        docker-langserver.command = lib.getExe pkgs.dockerfile-language-server;
        docker-compose-langserver.command = lib.getExe pkgs.docker-compose-language-service;
        markman.command = lib.getExe pkgs.marksman;
      };
    };
  };
}
