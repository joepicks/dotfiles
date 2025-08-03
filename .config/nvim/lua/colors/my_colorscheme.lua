vim.cmd("highlight clear")
vim.o.background = "dark"
vim.g.colors_name = "doors_of_hell"

-- Palette
local fg         = "#e5e5e5"
local bg         = "#0c0c0c"
local bg_alt     = "#1a1a1a"
local gray       = "#808080"
local gray_dark  = "#404040"
local red        = "#a83232"
local orange     = "#e25822"
local yellow     = "#f2aa4c"
local magenta    = "#c54b8c"
local blue       = "#768fd3"
local green      = "#95c623"
local cyan       = "#4ecdc4"

-- Editor UI
vim.api.nvim_set_hl(0, "Normal",       { fg = fg, bg = bg })
vim.api.nvim_set_hl(0, "NormalNC",     { fg = fg, bg = bg })
vim.api.nvim_set_hl(0, "LineNr",       { fg = gray_dark })
vim.api.nvim_set_hl(0, "CursorLineNr", { fg = orange, bold = true })
vim.api.nvim_set_hl(0, "CursorLine",   { bg = bg_alt })
vim.api.nvim_set_hl(0, "CursorColumn", { bg = bg_alt })
vim.api.nvim_set_hl(0, "Visual",       { bg = "#301010" })
vim.api.nvim_set_hl(0, "MatchParen",   { bg = "#402020", bold = true })
vim.api.nvim_set_hl(0, "NormalFloat", { fg = fg, bg = bg })
vim.api.nvim_set_hl(0, "ColorColumn", { bg = bg_alt })

-- Syntax
vim.api.nvim_set_hl(0, "Comment",      { fg = gray, italic = true })
vim.api.nvim_set_hl(0, "Keyword",      { fg = red, bold = true })
vim.api.nvim_set_hl(0, "Function",     { fg = orange })
vim.api.nvim_set_hl(0, "Identifier",   { fg = green })
vim.api.nvim_set_hl(0, "String",       { fg = yellow })
vim.api.nvim_set_hl(0, "Number",       { fg = cyan })
vim.api.nvim_set_hl(0, "Constant",     { fg = yellow })
vim.api.nvim_set_hl(0, "Type",         { fg = blue })
vim.api.nvim_set_hl(0, "Operator",     { fg = magenta })
vim.api.nvim_set_hl(0, "Statement",    { fg = red })

-- Status & UI
vim.api.nvim_set_hl(0, "StatusLine",   { fg = fg, bg = "#1e1e1e" })
vim.api.nvim_set_hl(0, "StatusLineNC", { fg = gray, bg = "#1e1e1e" })
vim.api.nvim_set_hl(0, "VertSplit",    { fg = gray_dark })
vim.api.nvim_set_hl(0, "WinSeparator", { fg = gray_dark })

-- Menu
vim.api.nvim_set_hl(0, "Pmenu",        { fg = fg, bg = "#1c1c1c" })
vim.api.nvim_set_hl(0, "PmenuSel",     { fg = bg, bg = orange })
vim.api.nvim_set_hl(0, "PmenuThumb",   { bg = "#444444" })
vim.api.nvim_set_hl(0, "PmenuSbar",    { bg = "#2a2a2a" })

-- Search & Selection
vim.api.nvim_set_hl(0, "Search",       { bg = red, fg = bg })
vim.api.nvim_set_hl(0, "IncSearch",    { bg = orange, fg = bg, bold = true })
vim.api.nvim_set_hl(0, "CurSearch",    { bg = yellow, fg = bg, bold = true })

-- Fold & Diff
vim.api.nvim_set_hl(0, "Folded",       { fg = gray, bg = "#111111" })
vim.api.nvim_set_hl(0, "FoldColumn",   { fg = gray_dark, bg = bg })
vim.api.nvim_set_hl(0, "DiffAdd",      { bg = "#133313" })
vim.api.nvim_set_hl(0, "DiffChange",   { bg = "#2a2a13" })
vim.api.nvim_set_hl(0, "DiffDelete",   { bg = "#331313" })
vim.api.nvim_set_hl(0, "DiffText",     { bg = "#3c2a1a" })

-- Diagnostics
vim.api.nvim_set_hl(0, "DiagnosticError", { fg = red })
vim.api.nvim_set_hl(0, "DiagnosticWarn",  { fg = yellow })
vim.api.nvim_set_hl(0, "DiagnosticInfo",  { fg = blue })
vim.api.nvim_set_hl(0, "DiagnosticHint",  { fg = cyan })
vim.api.nvim_set_hl(0, "DiagnosticOk",    { fg = green })
