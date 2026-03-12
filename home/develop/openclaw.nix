{ inputs, ... }:
{
  imports = [
    inputs.openclaw.homeModules.default
  ];
  programs.openclaw = {
    enable = true;
  };
}
