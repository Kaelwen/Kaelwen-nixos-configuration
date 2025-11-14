{
  config,
  ...
}:
let
  photoViewer = "org.gnome.Loupe.desktop";
  pdfViewer = "org.gnome.Evince.desktop";

in
{
  xdg = {
    enable = true;
    userDirs = {
      enable = true;
      # 设置各个用户目录的路径
      desktop = "${config.home.homeDirectory}/桌面";
      documents = "${config.home.homeDirectory}/文档";
      download = "${config.home.homeDirectory}/下载";
      music = "${config.home.homeDirectory}/音乐";
      pictures = "${config.home.homeDirectory}/图片";
      publicShare = "${config.home.homeDirectory}/公共";
      templates = "${config.home.homeDirectory}/模板";
      videos = "${config.home.homeDirectory}/视频";
    };
    mimeApps = {
      enable = true;
      defaultApplications = {
        "image/png" = [ photoViewer ];
        "image/jpeg" = [ photoViewer ];
        "image/gif" = [ photoViewer ];
        "image/bmp" = [ photoViewer ];
        "image/tiff" = [ photoViewer ];
        "image/webp" = [ photoViewer ]; # WebP 格式
        "image/svg+xml" = [ photoViewer ]; # SVG 矢量图
        "image/heic" = [ photoViewer ]; # HEIC 格式（苹果常用)
        "application/pdf" = [ pdfViewer ];

      };
    };
    # desktopEntries = {
    #   qq = {
    #     name = "QQ";
    #     exec = "steam-run ${pkgs.qq}/bin/qq --disable-gpu --disable-gpu-compositing %U";
    #     icon = "${pkgs.qq}/share/icons/hicolor/512x512/apps/qq.png";
    #     categories = [ "Network" ];
    #     comment = "轻松做自己";
    #   };
    # };
  };
}
