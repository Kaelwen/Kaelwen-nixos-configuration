{ pkgs, ... }:

{
  home.packages = with pkgs; [
    # (qq.override {
    #   commandLineArgs = "--disable-gpu --enable-wayland-ime --wayland-text-input-version=3";
    # })
    telegram-desktop
    wechat
    animeko

  ];

  #我这一步只是为了qq能吃到主题图标
  #nixpkgs的包的图标路径写死了
  xdg.desktopEntries.qq = {
    name = "QQ";
    exec = "${pkgs.qq}/bin/qq --disable-gpu --enable-wayland-ime --wayland-text-input-version=3 %U";
    icon = "qq";
    terminal = false;
    type = "Application";
    categories = [
      "Network"
      # "InstantMessaging"
    ];
    comment = "QQ";
  };

}
