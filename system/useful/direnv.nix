{pkgs,...}:{
  
  environment.systemPackages = with pkgs; [
    direnv
    nix-direnv
  ];
  # 配置 direnv 全局钩子
  programs.direnv.enable = true;
  programs.direnv.nix-direnv.enable = true;
}