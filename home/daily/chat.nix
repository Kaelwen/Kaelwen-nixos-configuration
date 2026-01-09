{ pkgs, ... }:
# let
# wechat-wrapper = pkgs.writeShellScriptBin "wechat" ''
#   export QT_IM_MODULE=fcitx
#   export FCITX_QT_GUI_STYLE=fusion
#   exec ${pkgs.wechat}/bin/wechat --disable-gpu --enable-wayland-ime "$@"
# '';
# in
{
  home.packages = [
    # wechat-wrapper
    (pkgs.qq.override {
      commandLineArgs = "--disable-gpu --enable-wayland-ime --wayland-text-input-version=3";
    })
    pkgs.telegram-desktop
  ];
  xdg.desktopEntries.wechat = {
    name = "WeChat";
    exec = "env QT_IM_MODULE=fcitx ${pkgs.wechat}/bin/wechat";
    icon = "wechat";
    categories = [
      "Network"
      "InstantMessaging"
    ];
  };
}
