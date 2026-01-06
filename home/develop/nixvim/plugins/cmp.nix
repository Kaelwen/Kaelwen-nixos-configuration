{ ... }:
{
  programs.nixvim.plugins = {
    cmp = {
      enable = true;
      autoEnableSources = true;
      settings = {
        sources = [
          { name = "buffer"; }
          { name = "path"; }
          { name = "spell"; }
          { name = "emoji"; }
          { name = "luasnip"; }
          { name = "nvim_lsp"; }
        ];
        mapping = {
          "<Tab>" = "cmp.mapping(cmp.mapping.select_next_item(), {'i', 's'})";
          "<S-Tab>" = "cmp.mapping(cmp.mapping.select_prev_item(), {'i', 's'})";
          "<CR>" = "cmp.mapping.confirm({ select = true })";
          # "<C-Space>" = "cmp.mapping.complete()";
          # "<C-d>" = "cmp.mapping.scroll_docs(-4)";
          # "<C-e>" = "cmp.mapping.close()";
          # "<C-f>" = "cmp.mapping.scroll_docs(4)";
          # "<CR>" = "cmp.mapping.confirm({ select = true })";
          # "<Tab>" = "cmp.mapping.confirm({ select = true })";

          # "<Up>" = "cmp.mapping(cmp.mapping.select_prev_item(), {'i', 's'})";
          # "<Down>" = "cmp.mapping(cmp.mapping.select_next_item(), {'i', 's'})";
        };
      };
      cmp-buffer.enable = true;
      cmp-path.enable = true;
      cmp-spell.enable = true;
      cmp-emoji.enable = true;
      cmp-nvim-lsp.enable = true;
    };
  };
}
