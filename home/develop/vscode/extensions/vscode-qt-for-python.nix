{ pkgs, ... }:
pkgs.vscode-utils.extensionFromVscodeMarketplace {
  publisher = "seanwu";
  name = "vscode-qt-for-python";
  version = "7.6.0";
  sha256 = "sha256-mN8B3PJqVDRlKZyBUsdrZqLNknSwaj1YHzt92K5R288=";
}
