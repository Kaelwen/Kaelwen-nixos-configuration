{pkgs,...}:{
  home.packages = with pkgs; [
    alacritty
  ];
    xdg.terminal-exec = {
      enable = true;
      settings = {
        default = [ "alacritty.desktop" ];
      };
    };
}