{ ... }:

{
  programs.nixvim = {
    plugins.lsp = {
      enable = true;
      inlayHints = true;
      servers = {
        rust_analyzer = {
          enable = true;
          installCargo = true;
          installRustc = true;
        };
        pyright.enable = true;
        clangd.enable = true;
        nixd.enable = true;
        gopls.enable = true;
        dockerls.enable = true;
        cssls.enable = true;
        qmlls.enable = true;
        tailwindcss.enable = true;
        bashls.enable = true;
        marksman.enable = true;
      };

    };
    keymaps = [
      {
        key = "K";
        action = "<cmd>lua vim.lsp.buf.hover()<cr>";
        options.desc = "显示悬浮文档 / 悬浮信息";
      }
      # 查找实现/引用
      {
        key = "<leader>li";
        action = "<cmd>Telescope lsp_implementations<cr>";
        options.desc = "查找实现";
      }
      {
        key = "<leader>lr";
        action = "<cmd>Telescope lsp_references<cr>";
        options.desc = "查找引用";
      }
      # 代码结构查看
      {
        key = "<leader>lw";
        action = "<cmd>Telescope lsp_workspace_symbols<cr>";
        options.desc = "查找工作区符号";
      }
      {
        key = "<leader>lf";
        action = "<cmd>Telescope lsp_document_symbols<cr>";
        options.desc = "文件大纲";
      }
      # 代码关系查看
      {
        key = "<leader>l[";
        action = "<cmd>Telescope lsp_incoming_calls<cr>";
        options.desc = "被调列表";
      }
      {
        key = "<leader>l]";
        action = "<cmd>Telescope lsp_outgoing_calls<cr>";
        options.desc = "调用列表";
      }
      # 诊断查看
      {
        key = "<leader>le";
        action = "<cmd>Telescope diagnostics bufnr=0<cr>";
        options.desc = "当前文件诊断";
      }
      {
        key = "<leader>lW";
        action = "<cmd>Telescope diagnostics<cr>";
        options.desc = "全局诊断";
      }
      {
        key = "<leader>D";
        action = "<cmd>lua vim.diagnostic.open_float()<cr>";
        options.desc = "显示诊断信息 (浮窗)";
      }
      {
        key = "<leader>ld";
        action = "<cmd>lua vim.diagnostic.open_float()<cr>";
        options.desc = "打开当前行的诊断信息浮窗";
      }
      {
        key = "[d";
        action = "<cmd>lua vim.diagnostic.jump({ count=-1, float=true })<cr>";
        options.desc = "跳转到上一个诊断";
      }
      {
        key = "]d";
        action = "<cmd>lua vim.diagnostic.jump({ count=1, float=true })<cr>";
        options.desc = "跳转到下一个诊断";
      }
      {
        key = "<leader>lR";
        action = "<cmd>lua vim.lsp.buf.rename()<cr>";
        options.desc = "重命名符号";
      }
      {
        key = "<leader>la";
        action = "<cmd>lua vim.lsp.buf.code_action()<cr>";
        options.desc = "代码操作";
      }
      {
        key = "gD";
        action = "<cmd>lua vim.lsp.buf.declaration()<cr>";
        options.desc = "跳转到声明";
      }
      {
        key = "gd";
        action = "<cmd>lua vim.lsp.buf.definition()<cr>";
        options.desc = "转到定义";
      }
      {
        key = "gi";
        action = "<cmd>lua vim.lsp.buf.implementation()<cr>";
        options.desc = "查找实现";
      }
      {
        key = "gr";
        action = "<cmd>lua vim.lsp.buf.references()<cr>";
        options.desc = "查找引用";
      }
      {
        key = "gt";
        action = "<cmd>lua vim.lsp.buf.type_definition()<cr>";
        options.desc = "跳转到类型定义";
      }
    ];
    extraConfigLua = ''
      vim.api.nvim_create_autocmd('LspAttach', {
        callback = function()
          local _border = "rounded"
          vim.diagnostic.config({
            -- virtual_lines = true, -- 诊断提示虚拟行
            virtual_text = true, -- 诊断提示内行提示

            signs = {
              active = true,
                text = {
                  [vim.diagnostic.severity.ERROR] = "";
                  [vim.diagnostic.severity.WARN] = "",
                  [vim.diagnostic.severity.INFO] = "",
                  [vim.diagnostic.severity.HINT] = "💡",
                },
              },
              update_in_insert = true,
              -- update_in_insert = false,
              underline = true,
              severity_sort = true,
              float = {
                border = _border,
              },
            })
          end,
        })
    '';
  };

}
