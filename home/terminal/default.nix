{ config, lib, ... }:
let
  cfg = config.programs.terminal;
in
{
  imports = [
    # ./fastfetch.nix
    ./kitty.nix
    ./alacritty.nix
    ./starship/default.nix
    ./fish.nix
  ];
  options.programs.terminal = {
    tty = lib.mkOption {
      type = lib.types.enum [
        "none"
        "kitty"
        "alacritty"
      ];
      default = "kitty";
      description = "选择要哪个tty";
    };
  };
  config = {
    programs.terminal.kitty.enable = cfg.tty == "kitty";
    programs.terminal.alacritty.enable = cfg.tty == "alacritty";
  };
}
