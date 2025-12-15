{ ... }:
{
  programs.wofi = {
    enable = true;
    settings = {
      show = "drun";
      width = 600;
      height = 400;
      always_parse_args = true;
      show_all = false;
      insensitive = true;
      allow_images = true;
      columns = 2;
      # normal_window = true;
      allow_markup = true;
      prompt = "👍launcher mode🤔";
    };
  };
}
