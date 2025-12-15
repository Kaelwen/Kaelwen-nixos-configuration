{
  pkgs,
  lib,
  ...
}:

{
  home.packages = [ pkgs.nixd ];

  programs.vscode = {
    enable = true;
    package = pkgs.vscodium;

    profiles.default = {
      enableExtensionUpdateCheck = false;
      enableUpdateCheck = false;
      extensions = with pkgs.vscode-extensions; [

        ms-vscode-remote.remote-ssh
        ms-vscode.remote-explorer
        ms-ceintl.vscode-language-pack-zh-hans
        adpyke.codesnap
        saoudrizwan.claude-dev

        #python
        ms-python.python
        ms-pyright.pyright
        charliermarsh.ruff
        ms-python.debugpy

        #c/c++
        ms-vscode.cmake-tools
        ms-vscode.makefile-tools
        xaver.clang-format
        llvm-vs-code-extensions.vscode-clangd

        #go
        golang.go

        #rust
        rust-lang.rust-analyzer

        #nix
        bbenoist.nix
        brettm12345.nixfmt-vscode
        jnoortheen.nix-ide

        #docker
        ms-azuretools.vscode-docker
        # formulahendry.docker-extension-pack
        ms-azuretools.vscode-containers

        #前端
        bradlc.vscode-tailwindcss
        vue.volar

        # stylelint.vscode-stylelint
        skyapps.fish-vscode

        #配置文件格式
        tamasfe.even-better-toml
        zainchen.json
        redhat.vscode-yaml

        tekumara.typos-vscode

        yzhang.markdown-all-in-one

        yzhang.dictionary-completion

      ];

      userSettings = {
        "files.autoSave" = "onFocusChange";
        "editor.autoIndentOnPaste" = true;

        "editor.formatOnSave" = true;

        "files.associations" = {
          "*.css" = "tailwindcss";
        };

        "[python]" = {
          "editor.formatOnSave" = true;
          "editor.defaultFormatter" = "charliermarsh.ruff";
        };
        "[c]" = {
          "editor.formatOnSave" = true;
          "editor.defaultFormatter" = "xaver.clang-format";
        };
        "[cpp]" = {
          "editor.formatOnSave" = true;
          "editor.defaultFormatter" = "xaver.clang-format";
        };
        "[nix]" = {
          "editor.formatOnSave" = true;
          "editor.defaultFormatter" = "brettm12345.nixfmt-vscode";
        };

        "editor.tabSize" = "2";
        "git.confirmSync" = false;
        "git.enableSmartCommit" = true;
        # "locale" = "zh-cn";
        "nix.enableLanguageServer" = true;
        "nix.formatterPath" = "nixfmt";
        "nix.hiddenLanguageServerErrors" = [
          "textDocument/definition"
        ];
        "nix.serverPath" = "${pkgs.nixd}/bin/nixd";
        "nixfmt.path" = lib.getExe pkgs.nixfmt-rfc-style;
        "terminal.integrated.defaultProfile.linux" = "fish (2)";
        "terminal.integrated.inheritEnv" = false;
        "window.autoDetectColorScheme" = true;
        "workbench.preferredDarkColorTheme" = "Stylix";
        "workbench.iconTheme" = "vs-seti";
        # "files.defaultLanguage" = "zh-cn";
      };
    };
  };
}
