{ config, lib, ... }:
{
  # home.packages = with pkgs; [
  #   alacritty
  # ];
  # xdg.terminal-exec = {
  #   enable = true;
  #   settings = {
  #     default = [ "alacritty.desktop" ];
  #   };
  # };
  options.programs.terminal.alacritty = {
    enable = lib.mkEnableOption "alacritty terminal";
  };
  config = lib.mkIf config.programs.terminal.alacritty.enable {
    programs.alacritty = {
      enable = true;
    };
  };
}

