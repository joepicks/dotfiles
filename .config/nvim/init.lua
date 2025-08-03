-- GENERAL SETTINGS
vim.g.mapleader = " "
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.clipboard = "unnamedplus"
vim.opt.expandtab = true
vim.opt.shiftwidth = 2
vim.opt.tabstop = 2
vim.opt.smartindent = true
vim.opt.cursorline = true
vim.opt.signcolumn = "yes"
vim.opt.termguicolors = true
vim.opt.wrap = true 

-- THEME
-- require("colors.my_colorscheme")
-- vim.o.background = "dark" -- or "light"

-- KEYMAPS
vim.keymap.set({ "n", "v" }, "<leader>y", '"+y', { desc = "Yank to clipboard" })
vim.keymap.set({ "n", "v" }, "<leader>d", '"+d', { desc = "Delete to clipboard" })
vim.keymap.set("n", "<leader>/", function()
  require("Comment.api").toggle.linewise.current()
end, { desc = "Toggle line comment" })
vim.keymap.set("v", "<leader>/", "<ESC><cmd>lua require('Comment.api').toggle.linewise(vim.fn.visualmode())<CR>", { desc = "Toggle block comment" })
vim.keymap.set("n", "<leader>e", ":NvimTreeToggle<CR>", { desc = "Toggle file tree" })
vim.keymap.set("n", "<leader>n", ":BufferLineCycleNext<CR>", { silent = true, desc = "Next buffer" })
vim.keymap.set("n", "<leader>p", ":BufferLineCyclePrev<CR>", { silent = true, desc = "Previous buffer" })
vim.keymap.set("n", "<leader>x", ":bd<CR>", { desc = "Close buffer" })
vim.keymap.set("n", "<leader>fb", function()
  vim.cmd("!~/.local/share/nvim/mason/bin/black %")
end, { desc = "Format with Black" })

-- bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git", "clone", "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    lazypath
  })
end
vim.opt.rtp:prepend(lazypath)

-- load plugins
require("lazy").setup({

  -- Plugin manager manages itself
  { "folke/lazy.nvim" },

  -- File icons
  { "nvim-tree/nvim-web-devicons" },

  -- File tree
  {
    "nvim-tree/nvim-tree.lua",
    config = function()
      require("nvim-tree").setup()
    end
  },

  -- leader shortcut visual clues
  {
    "echasnovski/mini.clue",
    version = false,
    config = function()
      local miniclue = require("mini.clue")
      miniclue.setup({
        triggers = {
          -- Leader key triggers
          { mode = "n", keys = "<Leader>" },
          { mode = "v", keys = "<Leader>" },
          -- Built-in keymaps
          { mode = "n", keys = "g" },
          { mode = "n", keys = "]" },
          { mode = "n", keys = "[" },
        },
        clues = {
          miniclue.gen_clues.builtin_completion(),
          miniclue.gen_clues.g(),
          miniclue.gen_clues.marks(),
          miniclue.gen_clues.registers(),
          miniclue.gen_clues.windows(),
          miniclue.gen_clues.z(),
          -- Custom <leader> mappings (explicit descriptions required)
          { mode = "n", keys = "<leader>y", desc = "Yank to clipboard" },
          { mode = "v", keys = "<leader>y", desc = "Yank to clipboard" },
          { mode = "n", keys = "<leader>d", desc = "Delete to clipboard" },
          { mode = "v", keys = "<leader>d", desc = "Delete to clipboard" },
          { mode = "n", keys = "<leader>/", desc = "Toggle comment" },
          { mode = "v", keys = "<leader>/", desc = "Toggle comment" },
          { mode = "n", keys = "<leader>e", desc = "Toggle file tree" },
          { mode = "n", keys = "<leader>n", desc = "Next buffer" },
          { mode = "n", keys = "<leader>p", desc = "Previous buffer" },
          { mode = "n", keys = "<leader>x", desc = "Close buffer" },
        },
        window = {
          delay = 100, -- ms
          config = {
            border = "single",
          },
        },
      })
    end,
  },

  -- Commenting (can switch to mini.comment if preferred)
  {
    "numToStr/Comment.nvim",
    config = function()
      require("Comment").setup()
    end
  },

  -- Bufferline (tabs for buffers)
  {
    "akinsho/bufferline.nvim",
    version = "*",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      require("bufferline").setup({
        options = {
          mode = "buffers",
          diagnostics = "nvim_lsp",
          separator_style = "slant",
          show_close_icon = false,
        }
      })
      vim.opt.termguicolors = true
      vim.opt.showtabline = 2
    end
  },

  -- Mason LSP
  {
    "williamboman/mason.nvim",
    build = ":MasonUpdate",
    config = function()
      require("mason").setup()
    end
  },
  
  -- Mason LSP-Config
  {
    "williamboman/mason-lspconfig.nvim",
    dependencies = { "williamboman/mason.nvim" },
    config = function()
      require("mason-lspconfig").setup({
        ensure_installed = {
          "pyright",                -- Python
          "clangd",                 -- C/C++
          "rust_analyzer",          -- Rust
          "lua_ls",                 -- Lua
          "gopls",                  -- Go
          "bashls",                 -- Bash
          "html", "cssls", "jsonls", "yamlls", "taplo",
          },
        automatic_installation = true,
      })
    end
  },

  -- Mini modules
  {
    "echasnovski/mini.nvim",
    version = false,
    config = function()
      require("mini.indentscope").setup()
      require("mini.comment").setup()
      require("mini.pairs").setup()
      require("mini.surround").setup()
      require("mini.trailspace").setup()
      require("mini.move").setup()
      require("mini.statusline").setup()
      require("mini.icons").setup()
    end
  },

  -- catppuccin
  { "catppuccin/nvim", name = "catppuccin", priority = 1000 },
})

-- LSP Built-in formatting
-- local on_attach = function(client, bufnr)
--   if client.server_capabilities.documentFormattingProvider then
--     vim.api.nvim_create_autocmd("BufWritePre", {
--       buffer = bufnr,
--       callback = function()
--         vim.lsp.buf.format()
--       end,
--     })
--   end
-- end

-- :LspFormat command
vim.api.nvim_create_user_command("LspFormat", function()
  vim.lsp.buf.format()
end, {})

