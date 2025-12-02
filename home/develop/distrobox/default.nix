{
  pkgs,
  ...
}:

{
  # xdg.configFile = {
  # "fish/conf.d/apx.fish".source = ./dotfiles/apx.fish;
  # };
  home.packages = with pkgs; [
    distrobox
    distrobox-tui
    # (apx.override {
    # distrobox = distrobox_git;
    # })

    #   (apx-gui.override {
    #     apx = (
    #       apx.override {
    #         distrobox = distrobox_git;
    #       }
    #     );
    #     gnome-console = null;
    #   })
  ];
}
