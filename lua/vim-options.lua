-- looks nice
local opt = vim.opt
local api = vim.api
local diagnostic = vim.diagnostic

-- Italic highlight group
api.nvim_set_hl(0, "LualineSessionName", { italic = true, fg = "#cdd6f4" })

-- diagnostics showing
diagnostic.config({
  virtual_text = true,      -- shows the message at end of line
  signs = true,             -- shows icons in the sign column
  underline = true,         -- underlines the problematic code
  update_in_insert = false, -- only update when leaving insert mode
})

-- tabs & indentation
opt.tabstop = 2 -- 2 spaces for tabs (prettier default)
opt.shiftwidth = 2 -- 2 spaces for indent width
opt.expandtab = true -- expand tab to spaces
opt.autoindent = true -- copy indent from current line when starting new one
opt.wrap = false

-- search settings
opt.ignorecase = true -- ignore case when searching
opt.smartcase = true -- if you include mixed case in your search, assumes you want case-sensitive

-- not sure what this does
opt.cursorline = true

-- no transparency for completion windows 
opt.pumblend = 0

-- show sign column so that text doesn't shift
opt.signcolumn = "yes"

-- backspace
opt.backspace = "indent,eol,start" -- allow backspace on indent, end of line or insert mode start position

-- line number stuff
opt.relativenumber = true
opt.number = true

-- scroll off limit (keep lower limit of page with lines bc pretty :D)
opt.scrolloff = 8

-- split windows
opt.splitright = true -- split vertical window to the right
opt.splitbelow = true -- split horizontal window to the bottom
