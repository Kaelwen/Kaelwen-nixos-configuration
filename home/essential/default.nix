{ config, lib, ... }:
let
  cfg = config.programs.essential;
in
{
  imports = [
    ./thunar
    ./nautilus
  ];
  options.programs.essential = {
    fileChoose = lib.mkOption {
      type = lib.types.enum [
        "none"
        "thunar"
        "nautilus"
      ];
      default = "thunar";
      description = "选择要哪个文件选择器";
    };
  };
  config = {
    programs.essential.thunar.enable = cfg.fileChoose == "thunar";
    programs.essential.nautilus.enable = cfg.fileChoose == "nautilus";
  };
}
