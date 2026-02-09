{ lib, ... }:
{
  programs.zed-editor.userSettings = {
    inlay_hints = {
      enabled = true;
      show_type_hints = true;
      show_parameter_hints = true;
      show_other_hints = true;
      show_background = false;

      edit_debounce_ms = 700;
      # // 滚动后等待请求提示的时间（设为0可取消防抖延迟）
      scroll_debounce_ms = 50;
      toggle_on_modifiers_press = {
        control = false;
        shift = false;
        alt = false;
        platform = false;
        function = false;
      };
    };
    theme = lib.mkForce {
      mode = "system";
      light = "Tokyo Night Moon";
      dark = "Tokyo Night Moon";
    };
    icon_theme = lib.mkForce "Catppuccin Frappé";
    # ui_font_size = lib.mkForce 15;
    ui_font_weight = 500.0;
    unnecessary_code_fade = 0.7;
    helix_mode = true;
  };
}
