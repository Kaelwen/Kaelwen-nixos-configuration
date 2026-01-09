# ～/.config/home-manager/home.nix

{ config, pkgs, ... }:

let
  # 定义你要“导出”到 ～/.local/share/fonts 的字体包
  onlyofficeFonts = with pkgs; [
    noto-fonts
    noto-fonts-cjk-sans
    noto-fonts-cjk-serif
    fira-code
    sarasa-gothic
    wqy_zenhei
    wqy_microhei
  ];

  # 合并所有字体文件到一个目录
  mergedOnlyofficeFonts =
    pkgs.runCommand "onlyoffice-fonts"
      {
        preferLocalBuild = true;
        allowSubstitutes = false;
      }
      ''
        mkdir -p $out
        # 从每个字体包中提取字体文件
        ${pkgs.lib.concatMapStrings (pkg: ''
          if [ -d "${pkg}/share/fonts" ]; then
            cp -r "${pkg}/share/fonts/"* $out/ 2>/dev/null || true
          fi
        '') onlyofficeFonts}
        # 清理可能的子目录嵌套（确保 flat 结构）
        find $out -mindepth 2 -type f -exec mv {} $out \; 2>/dev/null || true
        rmdir $out/* 2>/dev/null || true
      '';
in
{
  # 启用 fontconfig（对其他应用仍有用）
  fonts.fontconfig.enable = true;

  # 将合并后的字体部署到 ～/.local/share/fonts
  home.file.".local/share/fonts".source = mergedOnlyofficeFonts;
  home.file.".local/share/fonts".recursive = true;

  # 激活时刷新字体缓存（关键！）
  # home.activation.fontCache = pkgs.writeShellScript "font-cache" ''
  #   echo "Updating font cache for ONLYOFFICE..."
  #   ${pkgs.fontconfig}/bin/fc-cache -fv ～/.local/share/fonts
  # '';
}
