{
  pkgs, # Nixpkgs 包集合，用于引用系统软件包
  lib, # Nix 标准库函数（如 mkForce、getExe 等）
  ... # 忽略其他未使用的参数
}:

{
  programs.zed-editor = {
    enable = true; # 启用 Zed 编辑器
    installRemoteServer = true; # 安装 Zed Remote Server（用于远程开发或协作）

    # 禁用用户通过 UI 修改设置和任务，强制使用此 Nix 配置（声明式管理）
    mutableUserSettings = false;
    mutableUserTasks = false;

    # 安装的 Zed 扩展列表（来自 Zed Marketplace）
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
    ];

    # 额外安装的系统级工具包（供 Zed 调用，如 LSP、formatter）
    extraPackages = with pkgs; [
      nixd # Nix 的现代 LSP 服务器
      nixfmt-rfc-style # Nix 格式化工具（RFC 风格）
      prettier # 通用代码格式化工具
      pyright # Python 类型检查 LSP
      ruff # Python linter 和 formatter（超快）
    ];

    # 用户设置（对应 Zed 的 settings.json 内容，但以 Nix 声明式方式定义）
    userSettings = {
      # AI Agent 相关设置（Zed 的智能辅助功能）
      agent = {
        play_sound_when_agent_done = true; # Agent 任务完成时播放提示音
        always_allow_tool_actions = true; # 允许 Agent 自动执行工具操作（如修复）
        model_parameters = [ ]; # 自定义模型参数（留空表示默认）
      };

      # 诊断（Diagnostics）配置
      diagnostics = {
        lsp_pull_diagnostics = {
          debounce_ms = 100; # 使用 pull 模式获取诊断，防抖 100ms
        };
        inline = {
          enabled = true; # 启用内联诊断（错误/警告直接显示在代码下方）
        };
      };

      # Prettier 允许作为格式化器
      prettier = {
        allowed = true;
      };

      # 文档颜色（如 CSS 颜色）以内联提示（inlay）形式显示
      lsp_document_colors = "inlay";

      # Inlay Hints（如参数名、类型提示）设置
      inlay_hints = {
        show_background = false; # 不显示背景色（更清爽）
        enabled = true; # 启用 inlay hints
      };

      # 基础编辑行为
      soft_wrap = "none"; # 不自动软换行
      tab_size = 2; # Tab 宽度为 2 个空格
      scrollbar = {
        cursors = true; # 滚动条上显示光标位置
        axes = {
          horizontal = true; # 启用水平滚动条
        };
        show = "auto"; # 滚动条自动显示/隐藏
      };

      # Minimap（代码缩略图）配置
      minimap = {
        max_width_columns = 60; # 最大宽度 60 列
        current_line_highlight = "line"; # 高亮当前行
        thumb_border = "left_open"; # 滑块左侧开口样式
        thumb = "always"; # 始终显示滑块
        display_in = "active_editor"; # 仅在当前编辑器显示
        show = "auto"; # 自动显示/隐藏
      };

      # 代码片段与签名帮助
      snippet_sort_order = "inline"; # 片段排序优先内联
      show_signature_help_after_edits = true; # 编辑后显示函数签名帮助
      auto_signature_help = true; # 自动触发签名帮助

      # Sticky Scroll（滚动时固定顶部上下文）
      sticky_scroll = {
        enabled = true;
      };

      # 其他 UI/UX 行为
      autoscroll_on_clicks = false; # 点击时不自动滚动
      cursor_shape = "bar"; # 光标为竖线
      on_last_window_closed = "quit_app"; # 关闭最后一个窗口时退出应用
      when_closing_with_no_tabs = "keep_window_open"; # 无标签页时仍保留窗口

      # 活动面板修饰（非活动面板透明度等）
      active_pane_modifiers = {
        border_size = 2.0; # 边框大小
        inactive_opacity = 0.8; # 非活动面板 80% 不透明度
      };

      # 自动更新与保存
      auto_update = false; # 禁用自动更新
      autosave = "on_focus_change"; # 失去焦点时自动保存

      # 键盘映射与字体
      base_keymap = "VSCode"; # 使用 VS Code 快捷键
      buffer_font_size = lib.mkForce 14; # 编辑区字体大小（强制覆盖）
      buffer_font_weight = 400.0; # 编辑区字体粗细（正常）

      # 协作面板（禁用按钮）
      collaboration_panel = {
        button = false;
      };

      # 当前行高亮整行
      current_line_highlight = "all";
      disable_ai = false; # 不禁用 AI 功能
      format_on_save = "on"; # 保存时自动格式化

      # Git 集成
      git = {
        git_gutter = "tracked_files"; # 仅对已跟踪文件显示 gutter 标记
        inline_blame = {
          delay_ms = 2000; # 2 秒后显示内联 blame
          enabled = true;
          show_commit_summary = true; # 显示提交摘要
        };
      };

      # Git 面板
      git_panel = {
        button = true; # 显示 Git 面板按钮
        dock = "left"; # 停靠在左侧
      };

      # UI 主题与字体
      icon_theme = lib.mkForce "Catppuccin Frappé"; # 强制使用 Catppuccin Frappé 图标主题
      ui_font_size = lib.mkForce 15; # UI 字体大小
      ui_font_weight = 500.0; # UI 字体粗细（中等）
      unnecessary_code_fade = 0.7; # 无用代码淡化（保留 70% 不透明度）
      vim_mode = false; # 禁用 Vim 模式

      # 按语言定制的行为与工具
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
      };

      # LSP 服务器详细配置
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
      };

      # Node.js 路径配置（确保 Zed 能找到 node/npm）
      node = {
        path = lib.getExe pkgs.nodejs;
        npm_path = lib.getExe' pkgs.nodejs "npm";
      };

      # 预览标签页（临时标签）
      preview_tabs = {
        enable_preview_from_code_navigation = true; # 从代码跳转打开预览
        enable_preview_from_file_finder = true; # 从文件查找器打开预览
        enabled = true;
      };

      # 项目面板（左侧文件树）
      project_panel = {
        dock = "left";
        git_status = true; # 显示 Git 状态图标
        indent_guides = {
          show = "always"; # 始终显示缩进参考线
        };
        indent_size = 23; # 缩进区域宽度（像素）
        scrollbar = {
          show = "auto";
        };
      };

      # 启动时恢复上次会话
      restore_on_startup = "last_session";

      # 标签页行为
      tabs = {
        file_icons = true; # 显示文件图标
        git_status = true; # 显示 Git 状态
        show_diagnostics = "errors"; # 仅在标签显示错误（不显示警告）
      };

      # 遥测（完全禁用）
      telemetry = {
        diagnostics = false;
        metrics = false;
      };

      # 终端配置
      terminal = {
        env = {
          EDITOR = "zeditor --wait"; # 设置 EDITOR 环境变量，便于 git 等调用
        };
        shell = "system"; # 使用系统默认 shell
      };

      # 大纲面板（Outline）
      outline_panel = {
        button = true; # 显示大纲面板按钮
      };
    };
  };
}
