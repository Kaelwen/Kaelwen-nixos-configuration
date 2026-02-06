{ ... }:
let
  settings = import ./settings;
in
{
  programs.zed-editor = {
    enable = true;
    installRemoteServer = true;
    mutableUserSettings = false;
    mutableUserTasks = false;
  }
  // settings;

}
