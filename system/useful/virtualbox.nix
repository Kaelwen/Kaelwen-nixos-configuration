{ ... }:
{
  virtualisation.virtualbox = {
    host = {
      enable = true;
      # enableKvm = true;
      enableExtensionPack = true;
      # addNetworkInterface = false;
    };
  };

  # 添加用户到vboxusers组
  users.users.binigo.extraGroups = [ "vboxusers" ];

  # networking = {
  #   nat = {
  #     enable = true;
  #     internalInterfaces = [ "vboxnet0" ];
  #     externalInterface = "enp0s3";
  #   };
  # };

  # environment.activationScripts.virtualbox-network = ''
  #   ${pkgs.virtualbox}/bin/VBoxManage hostonlyif create
  #   ${pkgs.virtualbox}/bin/VBoxManage hostonlyif ipconfig vboxnet0 --ip 192.168.56.1 --netmask 255.255.255.0
  # '';
}
