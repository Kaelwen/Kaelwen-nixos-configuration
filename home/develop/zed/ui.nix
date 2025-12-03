{ pkgs, lib, ... }:
{
  programs.zed-editor = {
    userSettings = {
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
