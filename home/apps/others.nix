{ pkgs, ... }:
{
  home.packages = with pkgs; [
    wpsoffice-cn
    # libreoffice
    wechat
    (qq.override {
      commandLineArgs = "--disable-gpu --enable-wayland-ime --wayland-text-input-version=3";
    })
    telegram-desktop
    # spotify
    splayer
    filezilla
    obsidian
    localsend
    (bottles.override {
      removeWarningPopup = true;
    })
    kdePackages.kdenlive
    gimp3-with-plugins
    inkscape-with-extensions
    godot
  ];
}
