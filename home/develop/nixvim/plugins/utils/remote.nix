{ ... }:
{
  programs.nixvim = {
    enable = true;
    plugins = {
      remote-nvim = {
        enable = true;
        settings = {
          # 基本配置
          ssh_config = {
            ssh_binary = "ssh";
            ssh_config_file_paths = [ "$HOME/.ssh/config" ];
          };
          # 同步配置目录
          remote = {
            copy_dirs = {
              config = {
                base = "stdpath('config')";
                dirs = [ "*" ];
                compression = {
                  enabled = false;
                };
              };
              data = {
                base = "stdpath('data')";
                dirs = [ "lazy" ];
                compression = {
                  enabled = true;
                };
              };
            };
          };
        };
      };
    };
    # 自定义快捷键绑定
    keymaps = [
      {
        mode = "n";
        key = "<leader>rr";
        action = "<cmd>RemoteStart<CR>";
        options = {
          silent = true;
          desc = "Remote Start - 连接远程服务器";
        };
      }
      {
        mode = "n";
        key = "<leader>rs";
        action = "<cmd>RemoteStop<CR>";
        options = {
          silent = true;
          desc = "Remote Stop - 停止远程会话";
        };
      }
      {
        mode = "n";
        key = "<leader>ri";
        action = "<cmd>RemoteInfo<CR>";
        options = {
          silent = true;
          desc = "Remote Info - 查看会话信息";
        };
      }
      {
        mode = "n";
        key = "<leader>rc";
        action = "<cmd>RemoteCleanup<CR>";
        options = {
          silent = true;
          desc = "Remote Cleanup - 清理远程资源";
        };
      }
      {
        mode = "n";
        key = "<leader>rl";
        action = "<cmd>RemoteLog<CR>";
        options = {
          silent = true;
          desc = "Remote Log - 查看日志";
        };
      }
    ];
  };
}
