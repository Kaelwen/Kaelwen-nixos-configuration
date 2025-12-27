{ ... }:
{

  programs.nixvim.plugins.telescope = {
    enable = true;
    keymaps = {
      "<leader>f" = {
        action = "git_files";
        options = {
          desc = "查询文件";
        };
      };

    };
    enabledExtensions = [
      "project"
    ];
    extensions = {
      project.enable = true;
    };
  };
}
