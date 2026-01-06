{ config, pkgs, ... }:
{
  home.packages = with pkgs; [
    waybar
    hyprpicker
    grim
    slurp
    swappy
    wf-recorder
    cava
    blueberry
    wlogout
    nmgui
    pavucontrol
    brightnessctl
  ];

  xdg.configFile = {
    "waybar/config.jsonc".source = ./dotfiles/config.jsonc;
    "waybar/modules.jsonc".source = ./dotfiles/modules.jsonc;
    "waybar/modules-dividers.jsonc".source = ./dotfiles/modules-dividers.jsonc;
    "waybar/scripts".source = ./dotfiles/scripts;
  };

  home.file = {
    ".config/waybar/style.css".text = ''
               * {
                 font-family: "Maple Mono NF CN", monospace;
                 font-size: 14px;
                 border-radius: 0;
                 opacity: 1;
                 border: none;
               }

               window#waybar {
                 background: transparent;
                 color: @on_surface;
               }

               /* 鼠标悬浮信息提示 */
               tooltip {
                 background: #${config.lib.stylix.colors.base02};
                 border: 0.17em solid #${config.lib.stylix.colors.base07};
                 /* 3px */
                 opacity: 0.9;
               }

               tooltip label {
                 color: #${config.lib.stylix.colors.base05};
                 font-size: 0.89em;
                 /* 16px */
               }

               /* 工作区 */
               #workspaces button {
                 padding: 0px 0.56em;
                 /* 10px */
                 background: #${config.lib.stylix.colors.base03};
                 color: #${config.lib.stylix.colors.base06};
               }

               /* #workspaces label {
                   font-size: 1.22em; 
               } */

               #workspaces button:hover {
                 background: #${config.lib.stylix.colors.base03};
               }

               #workspaces button.active {
                 color: #${config.lib.stylix.colors.base07};
               }

               #custom-right_div.5 {
                 background-color: #${config.lib.stylix.colors.base02};
                 color: #${config.lib.stylix.colors.base03};
                 padding: 0px 0px;
                 font-size: 1.39em;
                 /* 25px */
               }

               #custom-right_div.6 {
                 background-color: #${config.lib.stylix.colors.base00};
                 color: #${config.lib.stylix.colors.base02};
                 padding: 0px 0px;
                 font-size: 1.39em;
                 /* 25px */
               }

               #custom-right_div.7 {
                 /* background-color: @; */
                 color: #${config.lib.stylix.colors.base00};
                 padding: 0px 0px;
                 font-size: 1.39em;
                 /* 25px */
               }


               #power-profiles-daemon,
               #battery,
               #memory,
               #cpu,
               #clock,
               #network,
               #bluetooth,
               #idle_inhibitor,
               #custom-screenshot,
               #custom-wfrec,
               #custom-colorpicker
                {
                 padding: 0px 0.7em;
               }

               #custom-left_div.4 {
                 color: #${config.lib.stylix.colors.base00};
                 padding: 0px;
                 font-size: 1.39em;
               }

               #custom-right_div.4 {
                 color: #${config.lib.stylix.colors.base00};
                 padding: 0px;
                 font-size: 1.39em;
               }

               #power-profiles-daemon,
               #battery,
               #idle_inhibitor,
               #custom-screenshot,
               #custom-wfrec,
               #custom-colorpicker {
                 background-color: #${config.lib.stylix.colors.base00};
               }
               #custom-left_div.3 {
                 background-color: #${config.lib.stylix.colors.base00};
                 color: #${config.lib.stylix.colors.base03};
                 padding: 0px 0px;
                 font-size: 1.39em;
                 /* 25px */
               }

               #custom-right_div.3 {
                 background-color: #${config.lib.stylix.colors.base00};
                 color: #${config.lib.stylix.colors.base03};
                 padding: 0px 0px;
                 font-size: 1.39em;
                 /* 25px */
               }
               #cpu,
               #memory {
                 background-color: #${config.lib.stylix.colors.base03};
                 color: #${config.lib.stylix.colors.base07};
      	 }
               #bluetooth,
               #network {
                 background-color: #${config.lib.stylix.colors.base03};
                 color: #${config.lib.stylix.colors.base06};
               }
               #custom-left_div.2 {
                 background-color: #${config.lib.stylix.colors.base03};
                 color: #${config.lib.stylix.colors.base06};
                 padding: 0px 0px;
                 font-size: 1.39em;
                 /* 25px */
               }
               #custom-right_div.2 {
            	background-color: #${config.lib.stylix.colors.base03};
                 color: #${config.lib.stylix.colors.base07};

                 padding: 0px 0px;
                 font-size: 1.39em;
                 /* 25px */
               }
               #clock {
                 background-color: #${config.lib.stylix.colors.base07};
                 color: #${config.lib.stylix.colors.base03};
               }
               #clock.date {
                 background-color: #${config.lib.stylix.colors.base06};
                 color: #${config.lib.stylix.colors.base02};
               }
               #custom-left_div.1 {
                 background-color: #${config.lib.stylix.colors.base06};
                 color: #${config.lib.stylix.colors.base02};
                 padding: 0px 0px;
                 font-size: 1.39em;
                 /* 25px */
               }
               #custom-right_div.1 {
                 background-color: #${config.lib.stylix.colors.base07};
                 color: #${config.lib.stylix.colors.base02};
                 padding: 0px 0px;
                 font-size: 1.39em;
                 /* 25px */
               }
               #custom-left_div.5 {
                 background-color: #${config.lib.stylix.colors.base02};
                 color: #${config.lib.stylix.colors.base03};
                 padding: 0px 0px;
                 font-size: 1.39em;
                 /* 25px */
               }
               #backlight {
                 background-color: #${config.lib.stylix.colors.base03};
               }
               #custom-left_div.6 {
                 background-color: #${config.lib.stylix.colors.base00};
                 color: #${config.lib.stylix.colors.base02};
                 padding: 0px 0px;
                 font-size: 1.39em;
                 /* 25px */
               }
               #pulseaudio {
                 padding: 0px 0px 0px 0.28em;
                 /* 5px */
               }
               #pulseaudio-slider {
                 padding: 0px 0px 0px 0.56em;
                 /* 10px */
                 margin: 0px;
               }
               #pulseaudio-slider,
               #pulseaudio {
                 background-color: #${config.lib.stylix.colors.base02};
                 color: #${config.lib.stylix.colors.base07};
               }
               #pulseaudio-slider slider {
                 min-height: 0px;
                 min-width: 0px;
                 opacity: 0;
                 background-image: none;
                 box-shadow: none;
                 background: none;
               }
               #pulseaudio-slider trough {
                 min-height: 0.56em;
                 /* 10px */
                 min-width: 4.44em;
                 /* 80px */
                 border-radius: 0.28em;
                 /* 5px */
                 background-color:#${config.lib.stylix.colors.base02};
               }

               #pulseaudio-slider highlight {
                 min-width: 0px;
                 border-radius: 0.28em;
                 /* 5px */
                 background-color: #${config.lib.stylix.colors.base07};
               }
               #custom-left_div.7 {
                 /* background-color: @; */
                 color: #${config.lib.stylix.colors.base00};
                 padding: 0px 0px;
                 font-size: 1.39em;
                 /* 25px */
               }
               #tray {
                 background-color: #${config.lib.stylix.colors.base00};
               }
    '';
  };
}
