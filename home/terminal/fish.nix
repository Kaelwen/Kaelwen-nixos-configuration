{ ... }:
{
  programs.fish = {
    enable = true;
    shellAbbrs = {
      shutdown = "systemctl poweroff";
      reboot = "systemctl reboot";
    };
    interactiveShellInit = ''
       if set -q KITTY_PID[1]; or test "$TERM" = "xterm-kitty"
        fastfetch
        set --global fish_greeting エミリア，私の名前はエミリア，ただのエミリアよ。
        # starship init fish | source
      end
    '';
  };
}
