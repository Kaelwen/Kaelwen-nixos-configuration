{ my-pkgs, pkgs, ... }:
let
  wps-wrapper = pkgs.writeShellScriptBin "wps" ''
    export QT_IM_MODULE=fcitx
    export FCITX_QT_GUI_STYLE=fusion
    exec ${my-pkgs.wpsoffice}/bin/wps
  '';
in
{
  home.packages = [ wps-wrapper ];
  xdg.desktopEntries.wpsoffice = {
    name = "wpsoffice";
    exec = "wps %U";
    icon = "wps-office2023-wpsmain";
    terminal = false;
  };
}
# { pkgs, ... }:
# {
#   home.packages = with pkgs; [
#     (wpsoffice-cn.overrideAttrs (old: {
#       postInstall = old.postInstall or "" + ''
#         wrapProgram \
#         export QT_IM_MODULE=fcitx \
#         export FCITX_QT_GUI_STYLE=fusion \
#         $out/bin/wps \
#       '';
#     }))
#   ];
# }
