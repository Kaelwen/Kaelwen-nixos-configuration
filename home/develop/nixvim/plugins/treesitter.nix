{ pkgs, ... }:
{
  programs.nixvim.plugins.treesitter = {
    enable = true;
    grammarPackages = with pkgs.vimPlugins.nvim-treesitter.builtGrammars; [
      bash
      json
      lua
      make
      markdown
      nix
      regex
      toml
      vim
      vimdoc
      xml
      yaml
    ];
    ensureInstalled = [
      "python"
      "javascript"
      "typescript"
      "rust"
    ];
    highlight.enable = true;
    indent.enable = true;
    # folding.enable = true;
  };
}
