{
  pkgs,
  ...
}:

{
  # ... 其他配置 ...

  environment.variables = {
    GTK_IM_MODULE = "fcitx";
    WAYLAND_IM_MODULE = "fcitx";
    QT_IM_MODULE = "fcitx";
    XMODIFIERS = "@im=fcitx";
    INPUT_METHOD = "fcitx"; # 可能不是所有程序都用这个，但加上无妨
    SDL_IM_MODULE = "fcitx"; # 针对SDL应用
    GLFW_IM_MODULE = "fcitx"; # 针对GLFW应用
  };

  i18n.inputMethod = {
    enable = true;
    type = "fcitx5";
    fcitx5 = {
      addons = with pkgs; [
        qt6Packages.fcitx5-chinese-addons
        # fcitx5-rime
        # fcitx5-nord
      ];
      waylandFrontend = true;
    };
  };
}
