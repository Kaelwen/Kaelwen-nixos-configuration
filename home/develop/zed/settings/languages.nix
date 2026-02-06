{ lib, pkgs, ... }:
{
  languages = {
    Nix = {
      language_servers = [ "nixd" ];
      formatter = {
        external = {
          arguments = [
            "--quiet"
            "--"
          ];
          command = lib.getExe pkgs.nixfmt;
        };
      };

    };
    Python = {
      language_servers = [
        "pyright"
      ];
      formatter = {
        external = {
          command = lib.getExe pkgs.ruff;
          arguments = [
            "format"
            "--stdin-filename"
            "{buffer_path}"
            "-"
          ];
        };
      };
    };
  };

}
