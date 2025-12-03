{ pkgs, lib, ... }:
{
  programs.zed-editor = {
    extraPackages = with pkgs; [
      nixd # Nix 的现代 LSP 服务器
      nixfmt-rfc-style # Nix 格式化工具（RFC 风格）
      prettier # 通用代码格式化工具
      pyright # Python 类型检查 LSP
      ruff # Python linter 和 formatter（超快）
      clang-tools
    ];
    extensions = [
      "basher" # Shell 脚本支持
      "catppuccin-icons" # Catppuccin 图标主题
      "colorizer" # 彩色高亮颜色值（如 #ff0000）
      "git-firefly" # Git 相关增强（可能包括 blame/gutter）
      "html" # HTML 语言支持
      "log" # 日志文件语法高亮
      "kdl" # KDL（Keyed Data Language）支持
      "make" # Makefile 支持
      "neocmake" # CMake 支持（可能是 Neo 的 CMake 扩展）
      "nix" # Nix 语言支持
      "python" # Python 语言支持
      "sinppets" # 代码片段（注意：拼写应为 "snippets"，但扩展名如此）
      "toml" # TOML 配置文件支持
      "vue"
    ];
    userSettings = {
      prettier = {
        allowed = true;
      };

      languages = {
        JSON = {
          formatter = {
            external = {
              command = "prettier";
              arguments = [
                "--stdin-filepath"
                "{buffer_path}" # 传递文件路径给 Prettier
              ];
            };
          };
        };

        JSONC = {
          soft_wrap = "prefer_line"; # JSONC 文件优先按行软换行
          formatter = {
            external = {
              command = "prettier";
              arguments = [
                "--stdin-filepath"
                "{buffer_path}"
              ];
            };
          };
        };

        Nix = {
          formatter = {
            external = {
              arguments = [
                "--quiet"
                "--"
              ];
              command = lib.getExe pkgs.nixfmt; # 使用 nixfmt 格式化
            };
          };
          language_servers = [
            "nixd" # 启用 nixd LSP
            "!nil" # 显式禁用旧的 nil LSP
          ];
        };
        C = {
          language_servers = [
            "clangd"
          ];
          formatter = {
            external = {
              command = "clang-format";
            };
          };
        };
        Cpp = {
          language_servers = [
            "clangd"
          ];
          formatter = {
            external = {
              command = "clang-format";
            };
          };
        };
        Rust = {
          language_servers = [
            "rust-analyzer"
          ];
          formatter = {
            external = {
              command = lib.getExe pkgs.rustfmt;
            };
          };
        };
        Python = {
          language_servers = [
            "pyright" # 启用 Pyright
            "ruff" # 启用 Ruff（linting）
            "!basedpyright" # 禁用 basedpyright
            "!pylsp" # 禁用 pylsp
          ];
          formatter = {
            external = {
              command = "ruff";
              arguments = [
                "format"
                "--stdin-filename"
                "{buffer_path}"
                "-" # 从 stdin 读取内容
              ];
            };
          };
        };
        Vue = {
          language_servers = [
            "vue-language-server"
            "tailwindcss-language-server"
            "typescript-language-server"
          ];
        };
        Typescript = {
          language_servers = [
            "typescript-language-server"
          ];
        };
      };

      lsp = {
        pyright = {
          initialization_options = {
            pyright = {
              disableLanguageServices = false; # 启用语言服务
              disableOrganizeImports = false; # 启用组织导入
            };
          };
          settings = {
            python = {
              analysis = {
                typeCheckingMode = "basic"; # 基础类型检查
                diagnosticMode = "openFilesOnly"; # 仅对打开文件诊断（性能优化）
                autoImportCompletions = true; # 自动导入补全
                useLibraryCodeForTypes = true; # 使用库代码推断类型
              };
              # 将常见问题降级为 warning（而非 error）
              reportMissingImports = "warning";
              reportUnusedImport = "warning";
              reportUnusedVariable = "warning";
              reportUnusedFunction = "warning";
            };
          };
        };

        ruff = {
          initialization_options = {
            settings = {
              lineLength = 88; # 行长限制（兼容 Black）
              select = [
                "E"
                "W"
                "F"
                "I"
              ]; # 启用错误、警告、flake8、isort
              ignore = [
                # 忽略以下规则组
                "ANN" # Type annotations
                "D" # Docstrings
                "COM" # Comments
                "ISC" # String quotes
                "PL" # Pylint
                "ARG" # Unused arguments
                "ERA" # Erroneous lint
                "PGH" # Pygrep hooks
                "RUF" # Ruff-specific
              ];
              isort = {
                knownFirstParty = [ ]; # 无 first-party 包（可后续添加）
              };
            };
          };
        };

        nix = {
          binary = {
            path_lookup = true; # 从 PATH 查找 nix LSP（实际用 nixd）
          };
        };

        rust-analyzer = {
          binary = {
            path = lib.getExe pkgs.rust-analyzer; # 显式指定 rust-analyzer 路径
            path_lookup = true;
          };
        };
        vue-language-server = {
          binary = {
            path = lib.getExe pkgs.vue-language-server;
            path_lookup = true;
          };
        };
        typescript-language-server = {
          binary = {
            path = lib.getExe pkgs.typescript-language-server;
            path_lookup = true;
          };
        };
        tailwindcss-language-server = {
          binary = {
            path = lib.getExe pkgs.tailwindcss-language-server;
            path_lookup = true;
          };
        };
      };
    };
  };
}
