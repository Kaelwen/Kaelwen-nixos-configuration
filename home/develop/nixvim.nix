{ inputs, ... }:
{
  imports = [ inputs.nixvim.homeModules.nixvim ];
  # 在你的 configuration.nix 或 home.nix 中
  programs.nixvim = {
    enable = true;
    colorschemes.catppuccin.enable = true;
    clipboard = {
      # 剪贴板
      providers = {
        # 剪贴板提供程序
        wl-copy.enable = true;
        xclip.enable = true;
      };
      register = "unnamedplus"; # 剪贴板寄存器
    };
    globals = {
      mapleader = " "; # 映射leader键为空格
    };

    plugins = {
      bufferline.enable = true; # 缓冲区标签
      nvim-tree = {
        enable = true; # 文件树
        settings.git.enable = true; # 启用 Git 集成
      };
      web-devicons.enable = true; # 文件图标
      mini = {
        enable = true;
        modules = {
          icons.enable = true; # 极简图标
          surround.enable = true; # 文本包围 (ysiw" -> `""`)
          bufremove.enable = true; # 快速删除缓冲区
          indentscope.enable = true; # 缩进可视化
          pairs.enable = true; # 自动括号
        };
      };

      lsp.enable = true; # 启用 LSP 补全

      cmp = {
        # 补全
        enable = true;
        autoEnableSources = false; # 自动启用补全源
        settings.sources = [
          # 补全源
          { name = "nvim_lsp"; } # LSP 补全
          { name = "path"; } # 路径补全
          { name = "buffer"; } # 缓冲区补全
        ];
      };
      cmp-nvim-lsp.enable = true; # LSP 补全
      cmp-path.enable = true; # 路径补全
      cmp-buffer.enable = true; # 缓冲区补全

      lualine.enable = true; # 状态栏
      luasnip.enable = true; # 代码片段
      gitsigns.enable = true; # Git 变更提示

      treesitter = {
        # 语法高亮
        enable = true;
      };
      toggleterm = {
        # 终端
        enable = true;
      };
    };

    lsp = {
      inlayHints.enable = true; # 启用 LSP 内联提示
      servers = {
        pyright.enable = true; # Python
        clangd.enable = true; # C/C++
        golangci_lint_ls.enable = true; # Go
        tsserver.enable = true; # TypeScript/JavaScript

        rust_analyzer.enable = true; # Rust
        nil_ls.enable = true; # Nix
      };
    };

    keymaps = [
      # 快捷键 1: 切换文件树
      {
        mode = "n";
        key = "<leader>e"; # 按下 `空格 + e`
        action = "<cmd>NvimTreeToggle<cr>";
        options.noremap = true;
        options.silent = true;
      }
      # 快捷键 2: 在文件树中定位当前文件
      {
        mode = "n";
        key = "<leader>o"; # 按下 `空格 + o` (o for 'open')
        action = "<cmd>NvimTreeFindFile<cr>";
        options.noremap = true;
        options.silent = true;
      }
      # 快捷键 3: 打开终端
      {
        mode = "n";
        key = "<leader>/"; # 按下 `空格 + ``
        action = "<cmd>ToggleTerm<cr>";
        options.noremap = true;
        options.silent = true;
      }
    ];
  };
}
