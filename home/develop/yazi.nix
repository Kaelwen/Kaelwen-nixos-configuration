{ pkgs, ... }:
{
  programs.yazi = {
    enable = true;
    enableFishIntegration = true;
    plugins = {
      bookmarks = pkgs.yaziPlugins.bookmarks;
      git = pkgs.yaziPlugins.git;
      wl-clipboard = pkgs.yaziPlugins.wl-clipboard;
      ouch = pkgs.yaziPlugins.ouch;
      chmod = pkgs.yaziPlugins.chmod;
    };
  };
  # programs.fzf.enable = true;
}
