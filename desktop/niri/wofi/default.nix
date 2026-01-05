{ config, pkgs, ... }:
{
  home.packages = with pkgs; [
    wofi
  ];
  home.file = {
    ".config/wofi/config".text = ''
      allow_images=true
      allow_markup=true
      always_parse_args=true
      columns=2
      height=500
      insensitive=true
      no_actions=true
      prompt=👍launcher mode🤔
      show=drun
      show_all=false
      width=800
      	'';
    ".config/wofi/style.css".text = ''
      window {
        font-family: "Maple Mono NF CN";
        font-size: 10pt;
        margin: 0px;
        border: 3px solid #${config.lib.stylix.colors.base07}; /* 使用橙色作为边框以吸引注意 */
        background-color: #${config.lib.stylix.colors.base00}; /* 统一深色背景 */
      }
      #input {
        margin: 5px;
        border: none;
        color: #${config.lib.stylix.colors.base05}; /* 白色文字在深色背景下易于阅读 */
        background-color: #${config.lib.stylix.colors.base02}; /* 较浅的背景色使输入区域与窗口区分开来 */
      }
      /* 内外盒子背景与窗口保持一致 */
      #inner-box, #outer-box {
        margin: 5px;
        border: none;
        background-color: #${config.lib.stylix.colors.base00};
      }
      #scroll {
        margin: 0px;
        border: none;
      }
      #text {
        margin: 5px;
        border: none;
        color: #${config.lib.stylix.colors.base05}; /* 普通文本颜色 */
      }
      /* 未选中的可激活条目 */
      #entry.activatable #text {
        color: #${config.lib.stylix.colors.base0A}; /* 使用橙色来标记可激活项，增加视觉焦点 */
      }
      /* 所有条目内的元素（图标等） */
      #entry > * {
        color: #${config.lib.stylix.colors.base05};
      }
      /* 选中项：使用强调色作为背景 */
      #entry:selected {
        background-color: #${config.lib.stylix.colors.base03}; /* 蓝紫色背景突显选择状态 */
      }
      #entry:selected #text {
        color: #${config.lib.stylix.colors.base07}; /* 白色文字在选中状态下更加醒目 */
        font-weight: bold; /* 加粗字体增强视觉效果 */
      } 
    '';
  };

}
