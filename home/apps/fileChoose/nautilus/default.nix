{
  pkgs,
  lib,
  config,
  ...
}:
{
  options.programs.essential.nautilus = {
    enable = lib.mkEnableOption "nautilus文件选择器";
  };
  config = lib.mkIf config.programs.essential.nautilus.enable {
    home.packages = with pkgs; [
      nautilus
    ];
  };
}
