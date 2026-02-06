{ pkgs, ... }:
pkgs.vscode-utils.extensionFromVscodeMarketplace {
  publisher = "sst-dev";
  name = "opencode";
  version = "0.0.13";
  sha256 = "sha256-6adXUaoh/OP5yYItH3GAQ7GpupfmTGaxkKP6hYUMYNQ=";
}
