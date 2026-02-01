{ lib, pkgs, ... }:
{
  programs.zed-editor = {
    enable = true;
    installRemoteServer = true;
    userSettings = {
      agent = {
        enabled = false;
        # play_sound_when_agent_done = true;
        # always_allow_tool_actions = true;
        # model_parameters = [ ];
      };
      languages = {
        JSON = {
          formatter = {
            external = {
              command = lib.getExe pkgs.prettier;
            };
          };
        };
        Nix = {
          formatter = {
            external = {
              command = lib.getExe pkgs.nixfmt;
            };
          };
          language_servers = [ "nixd" ];
        };
      };
      lsp = {
        nixd = {
          binary = {
            path = lib.getExe pkgs.nixd;
            path_lookup = true;
          };
        };
      };
    };
  };
}
