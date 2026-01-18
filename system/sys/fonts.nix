{
  pkgs,
  my-pkgs,
  ...
}:

{

  # imports = [ ../../home/setting/fonts.nix ];
  fonts = {
    enableDefaultPackages = true;
    fontconfig.enable = true;
    fontDir.enable = true;
    packages =
      with pkgs;
      [
        # corefonts
        maple-mono.NF-CN
        nerd-fonts.noto
        # nerd-fonts.jetbrains-mono
        # nerd-fonts.iosevka
        noto-fonts-color-emoji
        noto-fonts-emoji-blob-bin
        noto-fonts-cjk-sans
        noto-fonts-cjk-serif
        wqy_microhei
        arkpandora_ttf

      ]
      ++ (with my-pkgs; [
        win10-font
      ]);
  };
}
