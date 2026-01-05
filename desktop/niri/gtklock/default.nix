{ lib, pkgs, ... }:
{
  programs.gtklock = {
    enable = true;
    config = {
      main = {
        idle-hide = true;
        idle-timeout = 10;
      };
    };
    # style = ''
    #   window {
    #     background-color: alpha(#1e1e2e,0.2);
    #   }
    # '';

    modules = with pkgs; [
      gtklock-playerctl-module
      gtklock-powerbar-module
      gtklock-userinfo-module
    ];
  };
  security.pam.services.gtklock.text = lib.readFile "${pkgs.gtklock}/etc/pam.d/gtklock";
}
