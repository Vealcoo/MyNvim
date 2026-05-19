require "nvchad.options"

-- add yours here!

local o = vim.o
local opt = vim.opt

o.cursorline = true
o.cursorlineopt = "number,line"
o.laststatus = 3
o.showmode = false
o.splitbelow = true
o.splitright = true
o.termguicolors = true
o.winborder = "rounded"
o.pumblend = 8
o.winblend = 0

opt.fillchars = {
  eob = " ",
  fold = " ",
  foldopen = "",
  foldsep = " ",
  foldclose = "",
  diff = "╱",
}

opt.list = true
opt.listchars = {
  tab = "  ",
  trail = "·",
  extends = "›",
  precedes = "‹",
  nbsp = "␣",
}

vim.diagnostic.config {
  update_in_insert = false,
  severity_sort = true,
  underline = true,
  signs = true,
  virtual_text = false,
  float = {
    border = "rounded",
    focusable = true,
    source = "if_many",
  },
}
