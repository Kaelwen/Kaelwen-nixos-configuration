{
  ...
}:

{
  programs.niri.settings.animations = {
    workspace-switch = {
      kind = {
        spring = {
          damping-ratio = 0.8;
          stiffness = 400;
          epsilon = 0.0001;
        };
      };
    };
    window-open = {
      easing = {
        duration-ms = 500;
        curve = "cubic-bezier";
        curve-args = [
          0.05
          0.9
          0.1
          1.05
        ];
      };
    };
    window-close = {
      easing = {
        duration-ms = 150;
        curve = "ease-out-quad";
      };
    };
    config-notification-open-close = {
      enable = true;
      kind = {
        spring = {
          damping-ratio = 0.7;
          stiffness = 800;
          epsilon = 0.001;
        };
      };
    };

    exit-confirmation-open-close = {
      enable = true;
      kind = {
        spring = {
          damping-ratio = 0.6;
          stiffness = 500;
          epsilon = 0.01;
        };
      };
    };
    screenshot-ui-open = {
      easing = {
        # enable = true;
        duration-ms = 200;
        curve = "ease-out-quad";
      };
    };
    overview-open-close = {
      kind = {
        spring = {
          damping-ratio = 0.8;
          stiffness = 400;
          epsilon = 0.0001;
        };
      };
    };
  };

}
