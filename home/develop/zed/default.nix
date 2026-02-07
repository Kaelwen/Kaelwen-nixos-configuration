{ ... }:
{
  imports = [
    ./settings
  ];
  programs.zed-editor = {
    enable = true;
    installRemoteServer = true;
    mutableUserSettings = false;
    mutableUserTasks = false;
    extensions = [
      "basher"
      "catppuccin-icons"
      "csharp"
      "colorizer"
      "git-firefly"
      "html"
      "log"
      "java"
      "kdl"
      "make"
      "neocmake"
      "nix"
      "python"
      "scss"
      "sinppets"
      "toml"
    ];
  };
}
