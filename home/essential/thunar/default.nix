{
  pkgs,
  lib,
  config,
  ...
}:
{
  options.programs.essential.thunar = {
    enable = lib.mkEnableOption "thunar文件选择器";
  };
  config = lib.mkIf config.programs.essential.thunar.enable {
    home.packages = with pkgs; [
      thunar
    ];
    xdg.configFile."Thunar/uca.xml".text =
      #xml
      ''
        <?xml version="1.0" encoding="UTF-8"?>
            <actions>
            <action>
            	<icon>utilities-terminal</icon>
            	<name>用${config.programs.terminal.tty}打开当前文件夹</name>
            	<submenu></submenu>
            	<unique-id>1770791249778811-1</unique-id>
            	<command>${config.programs.terminal.tty} --working-directory %f</command>
            	<description>Example for a custom action</description>
            	<range></range>
            	<patterns>*</patterns>
            	<startup-notify/>
            	<directories/>
            </action>
            </actions>

      '';
  };
}
