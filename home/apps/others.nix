{ pkgs, ... }:
{
  home.packages = with pkgs; [
    # libreoffice
    # wpsoffice-cn
    (libreoffice.overrideAttrs {
      variant = "fresh";
      withHelp = false;
      kdeIntegration = false;
      withJava = false;

      langs = [
        "en-GB"
        "en-US"
        "zh-CN"
      ];

      noto-fonts = null;
      noto-fonts-lgc-plus = null;
      noto-fonts-cjk-sans = null;
    })

    wechat
    (qq.override {
      commandLineArgs = "--disable-gpu --enable-wayland-ime --wayland-text-input-version=3";
    })
    telegram-desktop
    # spotify
    # vscode-fhs
    # zed-editor-fhs
    filezilla
    # openssh
    # ffmpeg
    obsidian
    localsend
    # typora
    # bilibili
    # cherry-studio
    (bottles.override {
      removeWarningPopup = true;
    })
    kdePackages.kdenlive
    gimp3-with-plugins
    inkscape-with-extensions
    godot
  ];
}
