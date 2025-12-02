{
  pkgs,
  lib,
  ...
}:

{
  home.packages = [ pkgs.nixd ];

  programs.vscode = {
    enable = true;
    # package = pkgs.vscodium;

    profiles.default = {
      enableExtensionUpdateCheck = false;
      enableUpdateCheck = false;
      extensions = with pkgs.vscode-extensions; [
        
        ms-vscode-remote.remote-ssh
        ms-vscode.remote-explorer
        ms-ceintl.vscode-language-pack-zh-hans

        #python
        ms-python.python
        # ms-pyright.pyright
        ms-python.vscode-pylance
        ms-python.debugpy

        #c/c++
        # ms-vscode.cpptools
        ms-vscode.cmake-tools
        # cheshirekow.cmake-format
        ms-vscode.makefile-tools
        xaver.clang-format
        llvm-vs-code-extensions.vscode-clangd
        
        #go
        golang.go

        #rust
        # 1yib.rust-bundle
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
        # febean.vue-format

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
        # "C_Cpp.autocompleteAddParentheses" = true;
        "files.autoSave" = "onFocusChange";
        "editor.autoIndentOnPaste" = true;

        "editor.formatOnSave" = true;

        "files.associations"={
            "*.css"="tailwindcss";
        };

        "editor.tabSize" = "2";
        "git.confirmSync" = false;
        "git.enableSmartCommit" = true;
        # "locale" = "zh-cn";
        "nix.enableLanguageServer" = true;
        "nix.formatterPath" = lib.getExe pkgs.nixfmt-rfc-style;
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
        "files.defaultLanguage"="zh-cn";
      };
    };
  };
}
