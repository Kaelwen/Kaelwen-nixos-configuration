{ userName, ... }:
{
  users.groups.i2c = { };
  users.users."${userName}" = {
    isNormalUser = true;
    description = "binigo";
    extraGroups = [
      "networkmanager"
      "wheel"
      "i2c"
      "video"
    ];
    useDefaultShell = true;

  };
}
