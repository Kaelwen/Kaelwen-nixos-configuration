{ pkgs, ... }:

{
  programs.nixvim.plugins = {
    lsp = {
      enable = true;
      inlayHints = true;
      keymaps = {
        diagnostic = {
          "<leader>lE" = "open_float";
          "[" = "goto_prev";
          "]" = "goto_next";
        };
        lspBuf = {
          "gD" = "declaration";
          "gd" = "definition";
          "gr" = "references";
          "gI" = "implementation";
          "gy" = "type_definition";
        };
      };
      servers = {
        rust_analyzer = {
          enable = true;
          installCargo = true;
          installRustc = true;
        };
        pyright.enable = true;
        clangd.enable = true;
        nixd.enable = true;
        gopls.enable = true;
        dockerls.enable = true;
        cssls.enable = true;
        marksman.enable = true;
        #
      };
    };
    lsp-format = {
      enable = true;
    };
    lspsaga = {
      enable = true;
      settings.lightbulb = {
        virtualText = true;
        sign = false;
      };
    };
    trouble.enable = true;
    lsp-signature.enable = true;
    otter.enable = true;
  };
  programs.nixvim.keymaps = [
    {
      mode = "n";
      key = "K";
      action = ":Lspsaga hover_doc<CR>";
    }
    {
      mode = "n";
      key = "<Leader>lo";
      action = ":Lspsaga outline<CR>";
    }
    {
      mode = "n";
      key = "<Leader>lr";
      action = ":Lspsaga rename<CR>";
    }
    {
      mode = "n";
      key = "<Leader>la";
      action = ":Lspsaga code_action<CR>";
    }
    {
      mode = "n";
      key = "<Leader>lf";
      action = ":Lspsaga finder<CR>";
    }
  ];
  programs.nixvim.extraPlugins = with pkgs.vimPlugins; [
    nvim-docs-view
  ];
}
