{
  config,
  ...
}:
let
  photoViewer = "org.gnome.gThumb.desktop";
  # photoViewer = "swayimg.desktop";
  # pdfViewer = "org.kde.okular.desktop";
  pdfViewer = "org.gnome.Evince.desktop";
  zipViewer = "org.gnome.FileRoller.desktop";
in
{
  xdg = {
    enable = true;
    userDirs = {
      enable = true;
      # 设置各个用户目录的路径
      desktop = "${config.home.homeDirectory}/Desktop";
      documents = "${config.home.homeDirectory}/Documents";
      download = "${config.home.homeDirectory}/Downloads";
      music = "${config.home.homeDirectory}/Music";
      pictures = "${config.home.homeDirectory}/Pictures";
      publicShare = "${config.home.homeDirectory}/Public";
      templates = "${config.home.homeDirectory}/Templates";
      videos = "${config.home.homeDirectory}/Videos";
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
        "image/avif" = [ photoViewer ];
        "application/pdf" = [ pdfViewer ];

        "application/zip" = [ zipViewer ];
        "application/vnd.rar" = [ zipViewer ];
        "application/x-rar-compressed" = [ zipViewer ];
        "application/x-7z-compressed" = [ zipViewer ];
        "application/gzip" = [ zipViewer ];
        "application/x-xz" = [ zipViewer ];
        "application/x-tar" = [ zipViewer ];

      };
    };
  };
}
