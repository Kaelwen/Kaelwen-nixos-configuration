{ pkgs, ... }:
{
  home.packages = with pkgs; [
    wpsoffice
    # libreoffice
    wechat
    (qq.override {
      commandLineArgs = "--disable-gpu --enable-wayland-ime --wayland-text-input-version=3";
    })
    telegram-desktop
    #spotify
    # splayer
    filezilla
    localsend
    (bottles.override {
      removeWarningPopup = true;
    })
    kdePackages.kdenlive
    gimp3-with-plugins
    go-musicfox
    baidupcs-go
  ];
}
