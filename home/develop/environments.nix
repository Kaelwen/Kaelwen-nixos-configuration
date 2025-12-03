{ pkgs, ... }:
{
  home.packages = with pkgs; [
    hexo-cli
    gcc
    go
    nodejs
    rustup
  ];
  home.sessionVariables = {
    RUSTUP_DIST_SERVER = "https://mirrors.ustc.edu.cn/rust-static";
    RUSTUP_UPDATE_ROOT = "https://mirrors.ustc.edu.cn/rust-static/rustup";
  };
}
