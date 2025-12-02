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
        switch-to-workspace-left = "<Super>Left";
        switch-to-workspace-right = "<Super>Right";
      };
    };
  };
}
