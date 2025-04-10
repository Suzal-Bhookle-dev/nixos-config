local opt = vim.opt
local o = vim.o
local api = vim.api

--------------------------------------------options---------------------------------------------
o.expandtab = true
o.shiftwidth = 2
o.smartindent = true
o.tabstop = 2
o.softtabstop = 2
o.cursorline = true
o.cursorlineopt = "both"

opt.fillchars = { eob = " " }
o.ignorecase = true
o.smartcase = true
o.mouse = "a"

-- Numbers
o.number = true
o.relativenumber = true
o.numberwidth = 2
o.ruler = false

-- Copy to clipboard
api.nvim_set_option("clipboard", "unnamedplus")

-- disable nvim intro
opt.shortmess:append("sI")

o.signcolumn = "yes"
o.splitbelow = true
o.splitright = true
o.timeoutlen = 400
o.undofile = true
