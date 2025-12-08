{
  pkgs,
  lib,
  ...
}:

{
  home.packages = with pkgs; [
    nixd
    llvmPackages_21.clang-tools
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
          language-servers = [
            "nixd"
          ];
        }
        {
          name = "c";
          auto-format = true;
          formatter.command = "clang-format";
          language-servers = [
            "clangd"
          ];
        }
        {
          name = "cpp";
          auto-format = true;
          formatter.command = "clang-format";
          language-servers = [
            "clangd"
          ];
        }
        {
          name = "python";
          auto-format = true;
          formatter.command = lib.getExe pkgs.python313Packages.ruff;
          language-servers = [
            "pylsp"
          ];
        }
        {
          name = "rust";
          auto-format = true;
          formatter.command = "rustfmt";
          language-servers = [
            "rust-analyzer"
          ];
        }
        {
          name = "go";
          auto-format = true;
          language-servers = [
            "gopls"
          ];
        }
        {
          name = "typescript";
          auto-format = true;
          language-servers = [
            "typescript-language-server"
          ];
        }
      ];
      language-server = {
        nixd.command = lib.getExe pkgs.nixd;
        pylsp.command = lib.getExe pkgs.python313Packages.python-lsp-server;
        gopls.command = lib.getExe pkgs.gopls;
        typescript-language-server.command = lib.getExe pkgs.typescript-language-server;
        tailwindcss-language-server.command = lib.getExe pkgs.tailwindcss-language-server;
        rust-analyzer.command = lib.getExe pkgs.rust-analyzer;
      };
    };
  };
}
