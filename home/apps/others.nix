{ pkgs, ... }:
{
  home.packages = with pkgs; [
    libreoffice
    wechat
    (qq.override {
      commandLineArgs = "--disable-gpu --enable-wayland-ime --wayland-text-input-version=3";
    })
    telegram-desktop
    # vscode-fhs
    # zed-editor-fhs
    filezilla
    # openssh
    # ffmpeg
    # obsidian
    typora
    # cherry-studio
    (bottles.override {
      removeWarningPopup = true;
    })
    kdePackages.kdenlive
    gimp3-with-plugins
    inkscape-with-extensions

    # postman
  ];
}
