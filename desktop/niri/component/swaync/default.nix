{ pkgs, lib, ... }:
{
  home.packages = with pkgs; [
    libnotify

  ];
  services.swaync = {
    enable = true;
    settings = {
      positionX = "right";
      positionY = "top";
      layer = "overlay";
      control-center-layer = "top";
      layer-shell = true;
      cssPriority = "application";
      control-center-margin-top = 0;
      control-center-margin-bottom = 0;
      control-center-margin-right = 0;
      control-center-margin-left = 0;
      notification-2fa-action = true;
      notification-inline-replies = false;
      notification-icon-size = 64;
      notification-body-image-height = 100;
      notification-body-image-width = 200;
      timeout = 4;
      timeout-low = 2;
      timeout-critical = 6;

      widgets = [
        # "label"
        "buttons-grid"
        "mpris"
        "title"
        "dnd"
        "notifications"
      ];

      widget-config = {
        title = {
          text = "Notifications";
          clear-all-button = true;
          button-text = " 󰎟 ";
        };
        dnd = {
          text = "Do not disturb";
        };
        # label = {
        #   max-lines = 1;
        #   text = "awa";
        # };
        mpris = {
          image-size = 96;
          image-radius = 12;
        };
        volume = {
          label = "󰕾";
          show-per-app = true;
        };
        buttons-grid = {
          actions = [
            {
              label = " ";
              command = lib.getExe pkgs.pavucontrol;
            }
            {
              label = " ";
              command = "${pkgs.swaynotificationcenter}/bin/swaync-client -t | ${pkgs.nmgui}/bin/nmgui";
            }
            {
              label = "󰂯";
              command = "${pkgs.swaynotificationcenter}/bin/swaync-client -t | ${pkgs.blueberry}/bin/blueberry";
            }
            {
              label = "󰏘";
              command = "nwg-look";
            }
          ];
        };
      };
    };
  };
}
