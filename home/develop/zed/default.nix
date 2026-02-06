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
  };
}
