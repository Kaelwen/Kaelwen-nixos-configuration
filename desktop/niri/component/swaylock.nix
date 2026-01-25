{ lib, pkgs, ... }:
{

  programs.swaylock = {
    enable = true;
    package = pkgs.swaylock-effects;
    settings = {
      effect-blur = "10x5";
      indicator-radius = 200;
      indicator-thickness = 15;
    };
  };
  xdg.configFile."swaylock/config".text = ''
    screenshots
    clock
    indicator
    indicator-radius=200
    indicator-thickness=15
    effect-blur=10x5
    font=Maple Mono NF CN
  '';
  # programs.gtklock = {
  #   enable = true;
  #   config = {
  #     main = {
  #       idle-hide = true;
  #       idle-timeout = 10;
  #     };
  #   };
  #   # style = ''
  #   #   window {
  #   #     background-color: alpha(#1e1e2e,0.2);
  #   #   }
  #   # '';
  #
  #   modules = with pkgs; [
  #     gtklock-playerctl-module
  #     gtklock-powerbar-module
  #     gtklock-userinfo-module
  #   ];
  # };
  # security.pam.services.gtklock.text = lib.readFile "${pkgs.gtklock}/etc/pam.d/gtklock";
}
