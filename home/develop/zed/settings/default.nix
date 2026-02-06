let
  lsp = import ./lsp.nix;
  languages = import ./languages.nix;
in
{
  userSettings = {
  }
  // lsp
  // languages;
}
