{ config, lib, ... }:
{
  options.programs.terminal.alacritty = {
    enable = lib.mkEnableOption "alacritty terminal";
  };
  config = lib.mkIf config.programs.terminal.alacritty.enable {
    programs.alacritty = {
      enable = true;
    };
  };
}
