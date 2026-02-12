{ userName, config, ... }:
{
  programs.labwc.enable = true;

  home-manager.users."${userName}" = {

    wayland.windowManager.labwc.rc = {
      keyboard = {
        default = true;
        keybind = [
          # <keybind key="W-Return"><action command="foot" name="Execute"></action></keybind>
          {
            "@key" = "W-t";
            action = {
              "@name" = "Execute";
              "@command" = config.programs.terminal.tty;
            };
          }
          # <keybind key="W-Esc"><action command="loot" name="Execute"></action></keybind>
          {
            "@key" = "W-Esc";
            action = {
              "@name" = "Execute";
              "@command" = "loot";
            };
          }
        ];
      };
    };
  };
}
