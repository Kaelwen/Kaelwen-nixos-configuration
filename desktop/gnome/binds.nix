{ ... }:
{
  dconf = {
    enable = true;
    settings = {
      "org/gnome/settings-daemon/plugins/media-keys" = {
        custom-keybindings = [
          "/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0/"
        ];
      };
      "org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0" = {
        name = "启动kitty终端";
        command = "kitty";
        binding = "<Primary><Alt>t";
      };
      "org/gnome/desktop/wm/keybindings" = {
        switch-applications = [ ];
        switch-applications-backward = [ ];
        switch-windows = [ "<Alt>Tab" ];
        switch-windows-backward = [ "<Super>Tab" ];
        maximize = [ "<Super>Up" ];
        unmaximize = [ "<Super>Down" ];
        minimize = [ ];
        move-to-workspace-left = [ "<Super>Left" ];
        move-to-workspace-right = [ "<Super>Right" ];
        # Disable alt+space binding
        activate-window-menu = [ ];
      };

    };
  };
}
