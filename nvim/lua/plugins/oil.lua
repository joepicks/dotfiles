
return {
  "stevearc/oil.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  lazy = false,
  opts = {
    default_file_explorer = true, -- replace netrw behavior without disabling it
    columns = { "icon" },
    view_options = { show_hidden = true },
  },
  keys = {
    { "-", function() require("oil").open() end, desc = "Open parent directory" },
  },
}
