{ pkgs, ... }:
{
  home.packages = with pkgs; [
    playerctl
    brightnessctl
  ];
  programs.quickshell = {
    enable = true;
    systemd.enable = true;
  };
  # programs.niri.settings = {
  #   binds = {
  #     "Mod+D" = {
  #       hotkey-overlay.title = "打开搜索";
  #       repeat = false;
  #       action.spawn = [
  #         "qs"
  #         "ipc"
  #         "call"
  #         "launcher"
  #         "toggle"
  #       ];
  # };
  # };
  # };
}
