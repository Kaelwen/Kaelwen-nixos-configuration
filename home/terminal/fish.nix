{ ... }:
{
  programs.fish = {
    enable = true;
    shellAbbrs = {
      shutdown = "systemctl poweroff";
      reboot = "systemctl reboot";
    };
    interactiveShellInit = ''
      set --global fish_greeting エミリア，私の名前はエミリア，ただのエミリアよ。
    '';
  };
}
