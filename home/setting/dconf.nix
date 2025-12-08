{
  ...
}:

{
  dconf = {
    enable = true;
    settings = {
      "org/virt-manager/virt-manager/connections" = {
        autoconnect = [ "qemu:///system" ];
        uris = [ "qemu:///system" ];
      };
      # "org/gnome/desktop/interface" = {
      #   # color-scheme = "prefer-dark";
      #   document-font-name = "Maple Mono NF CN 11";
      #   monospace-font-name = "Maple Mono NF CN 11";
      #   accent-color = "teal";
      # };

      # 改这个没啥用，牛魔的被骗了。
      # "org/gnome/desktop/default-applications/terminal" = {
      #   exec = "kitty";
      #   exec-arg = "";
      # };
      # "org/cinnamon/desktop/applications/terminal" = {
      #   exec = "kitty";
      # };
    };
  };
}
