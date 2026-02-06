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
