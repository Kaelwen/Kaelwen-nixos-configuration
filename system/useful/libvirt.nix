{ pkgs, userName, ... }:
{
  programs.virt-manager.enable = true;
  users.users.${userName} = {
    isNormalUser = true;
    extraGroups = [
      "libvirtd"
      "kvm"
    ];
  };

  virtualisation.libvirtd = {
    enable = true;
    qemu = {
      runAsRoot = true;
      swtpm.enable = true;
      vhostUserPackages = with pkgs; [
        virtiofsd
        virtio-win
        virglrenderer
      ];
    };
  };

  boot.extraModprobeConfig = "options kvm-intel nested=1";

  # virtualisation.libvirtd.extraConfig = "uri_default = \"qemu:///system\"";

  virtualisation.spiceUSBRedirection.enable = true;
}
