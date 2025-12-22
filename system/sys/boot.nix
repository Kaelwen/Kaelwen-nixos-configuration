{ pkgs, ... }:
{
  boot.loader = {
    # systemd-boot.enable = true;
    # efi.canTouchEfiVariables = true;
    # systemd-boot.configurationLimit = 10;

    grub = {
      enable = true; # 启用 GRUB
      efiSupport = true; # 支持 EFI
      device = "nodev"; # 安装到当前 ESP 挂载点
      useOSProber = true; # 检测其他操作系统
      timeout = 10; # 设置引导超时时间（秒）``
    };
    efi.efiSysMountPoint = "/boot/efi"; # 挂载 EFI 分区
  };
  boot.kernelPackages = pkgs.linuxPackages_cachyos-lto;
  nix.gc = {
    automatic = true;
    dates = "weekly";
    options = "--delete-older-than 1w";
  };

}
