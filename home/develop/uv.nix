{ ... }:
{
  programs.uv = {
    enable = true;
    settings = {
      # python-downloads = "never";
      # python-preference = "only-system";
      pip.index-url = "https://mirrors.ustc.edu.cn/pypi/simple";
    };
  };
}
