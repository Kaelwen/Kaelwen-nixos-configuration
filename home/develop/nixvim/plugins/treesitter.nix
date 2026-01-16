{ pkgs, ... }:
{
  programs.nixvim.plugins.treesitter = {
    enable = true;

    highlight.enable = true;
    indent.enable = true;
    # folding.enable = true;
    grammarPackages = pkgs.vimPlugins.nvim-treesitter.allGrammars;
    nixvimInjections = true;
  };
}
