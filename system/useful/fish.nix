{
  pkgs,
  ...
}:

{
  users.defaultUserShell = pkgs.fish;

  environment.systemPackages = with pkgs; [
    bat
    tealdeer
    dust
    fd
    tokei
    duf
  ];

  programs.fish = {
    enable = true;
    shellAbbrs = {
      #commit = "git commit --all";
      #push = "git push";
      #rebuild = "nh os switch .";
      #rebuild-boot = "nh os boot .";
      
      #update = "nix flake update && git commit -a -m 'update.' && nh os boot . --ask";
      shutdown = "systemctl poweroff";
      reboot = "systemctl reboot";
      #cat = "bat";
      #du = "dust";
      #find = "fd";
      #df = "duf";
      #cd = "z";

      #nvim = "hx";
      #vim = "hx";
      #vi = "hx";
      #helix = "hx";
    };
    interactiveShellInit = ''
      fastfetch
      set --global fish_greeting エミリア，私の名前はエミリア，ただのエミリアよ。
    '';
    vendor = {
      functions.enable = true;
      config.enable = true;
      completions.enable = true;
    };
  };
}

