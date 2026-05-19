-- This file needs to have same structure as nvconfig.lua
-- https://github.com/NvChad/ui/blob/v3.0/lua/nvconfig.lua
-- Please read that file to know all available options :(

---@type ChadrcConfig
local M = {}

M.base46 = {
  theme = "oxocarbon",
  transparency = false,
  theme_toggle = { "oxocarbon", "one_light" },

  hl_override = {
    Comment = { italic = true },
    ["@comment"] = { italic = true },
    FloatBorder = { fg = "grey_fg", bg = "darker_black" },
    NormalFloat = { bg = "darker_black" },
    Pmenu = { bg = "darker_black" },
    PmenuSel = { bg = "one_bg3" },
  },
}

M.nvdash = { load_on_startup = true }
M.mason = {
  pkgs = {
    "bash-language-server",
    "clangd",
    "css-lsp",
    "gopls",
    "html-lsp",
    "json-lsp",
    "tailwindcss-language-server",
    "typescript-language-server",
  },
}
M.ui = {
  cmp = {
    icons_left = true,
    style = "default",
    abbr_maxwidth = 48,
  },
  telescope = {
    style = "bordered",
  },
  statusline = {
    theme = "minimal",
    separator_style = "round",
  },
  tabufline = {
    lazyload = false,
    bufwidth = 22,
    modules = {
      buffers = function()
        return require("configs.tabufline").buffers()
      end,
      btns = function()
        return require("configs.tabufline").btns()
      end,
    },
  },
}

return M
