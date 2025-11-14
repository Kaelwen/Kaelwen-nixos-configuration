{ pkgs, ... }:
{
  virtualisation.docker = {
    enable = true;
    daemon.settings = {
      registry-mirrors = [
        "https://docker.1ms.run"
        "https://docker.xuanyuan.me"
      ];
    };
  };
  users.users.binigo.extraGroups = [ "docker" ];
  environment.systemPackages = [ pkgs.docker-compose ];

}
