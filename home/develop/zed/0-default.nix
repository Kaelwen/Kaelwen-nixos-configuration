{ ... }:
{
  programs.zed-editor = {
    enable = true; # 启用 Zed 编辑器
    installRemoteServer = true; # 安装 Zed Remote Server（用于远程开发或协作）

    # 禁用用户通过 UI 修改设置和任务，强制使用此 Nix 配置（声明式管理）
    mutableUserSettings = false;
    mutableUserTasks = false;
  };
  imports = [
    ./lsp.nix
    ./ui.nix
  ];
}
