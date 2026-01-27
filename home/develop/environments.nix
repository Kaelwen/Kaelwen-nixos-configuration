{ pkgs, ... }:
{
  home.packages = with pkgs; [
    hexo-cli
    gcc
    cmake
    gnumake
    go
    nodejs
    rustup
    jdk21
  ];
  home.sessionVariables = {
    RUSTUP_DIST_SERVER = "https://mirrors.ustc.edu.cn/rust-static";
    RUSTUP_UPDATE_ROOT = "https://mirrors.ustc.edu.cn/rust-static/rustup";

    GOPROXY = "https://goproxy.cn,direct";
    GOSUMDB = "off";
  };
}
