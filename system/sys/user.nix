{ ... }:
{
  users.users.binigo = {
    isNormalUser = true;
    description = "binigo";
    extraGroups = [
      "networkmanager"
      "wheel"
    ];
    useDefaultShell = true;
    # hashedPassword = "$y$j9T$6gZ7oMbqXxIUsVlSDyYLv.$m/H7OSzGtWs6va8gu93FZaduMmutzEbGDlnoCw6G1LC";
    # packages = with pkgs; [
    #   #  thunderbird
    # ];
  };
}
