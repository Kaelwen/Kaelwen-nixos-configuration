{ config, lib, ... }:

{
  home.sessionVariables.PATH = "${config.home.homeDirectory}/bin:${
    config.home.sessionVariables.PATH or ""
  }";
}
