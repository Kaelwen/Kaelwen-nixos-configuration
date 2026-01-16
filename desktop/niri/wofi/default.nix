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
          padding: 0.5em; 
         
          background-color: #${config.lib.stylix.colors.base00};
          opacity: 0.8;
        }
        #input {
          margin: 1em;
          border-radius: 2em;
          border: none;
          color: #${config.lib.stylix.colors.base05}; 
          background-color: #${config.lib.stylix.colors.base02}; 
        }

        #inner-box {
            margin: 5px;
            border-radius: 12px;
            background-color: #${config.lib.stylix.colors.base02};
        }
        #outer-box {
            margin: 0px;
            border-radius: 0.4em;
            border: 0.2em solid #${config.lib.stylix.colors.base07};
            background-color: #${config.lib.stylix.colors.base00};
        }
        
        #scroll {
          margin: 0px;
          border: none;
        }
        #text {
          margin: 5px;
          border: none;
          color: #${config.lib.stylix.colors.base05};
        }

        #entry  {
            border-radius: 0.5em;
          color: #${config.lib.stylix.colors.base05}; 
          transition: all 0.3s ease;
        }

        #entry:selected {
          background-color: #${config.lib.stylix.colors.base02};
           border: 0.2em solid #${config.lib.stylix.colors.base07};
        }
        #entry:selected #text {
          color: #${config.lib.stylix.colors.base06}; 
          font-weight: bold; 
        }
    '';
  };
}
