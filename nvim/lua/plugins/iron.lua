return {
  {
    "Vigemus/iron.nvim",
    config = function()
      local iron = require("iron.core")
      local view = require("iron.view")
      local common = require("iron.fts.common")
      
      iron.setup({
        config = {
          scratch_repl = true,
          repl_definition = {
            sh = {
              command = {"zsh"}
            },
            python = {
              command = { "python3" },
              format = common.bracketed_paste_python,
              block_dividers = { "# %%", "#%%" },
            }
          },
          repl_filetype = function(bufnr, ft)
            return ft
          end,
          repl_open_cmd = view.bottom(40),
        },
        keymaps = {
          toggle_repl = "<leader>rr",
          restart_repl = "<leader>rR", -- calls `IronRestart` to restart the repl
          send_motion = "<leader>sc",
          visual_send = "<leader>sc",
          send_file = "<leader>sf",
          send_line = "<leader>sl",
          send_paragraph = "<leader>sp",
          send_until_cursor = "<leader>su",
          send_mark = "<leader>sm",
          send_code_block = "<leader>sb",
          send_code_block_and_move = "<leader>sn",
          mark_motion = "<leader>mc",
          mark_visual = "<leader>mc",
          remove_mark = "<leader>md",
          cr = "<leader>s<cr>",
          interrupt = "<leader>s<leader>",
          exit = "<leader>sq",
          clear = "<leader>cl",
        },
        highlight = {
          italic = true
        },
        ignore_blank_lines = true,
      })
    end,
  }
}
