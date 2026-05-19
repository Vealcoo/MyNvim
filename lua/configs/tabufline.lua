local api = vim.api
local fn = vim.fn
local get_opt = api.nvim_get_option_value
local strep = string.rep

local M = {}

local utils = require "nvchad.tabufline.utils"
local btn = utils.btn
local txt = utils.txt

local function filename(path)
  return path:match "([^/\\]+)[/\\]*$"
end

local function new_hl(group1, group2)
  local fg = api.nvim_get_hl(0, { name = group1 }).fg
  local bg = api.nvim_get_hl(0, { name = "Tb" .. group2 }).bg
  api.nvim_set_hl(0, group1 .. group2, { fg = fg, bg = bg })
  return "%#" .. group1 .. group2 .. "#"
end

local function unique_name(name, index)
  for i, bufnr in ipairs(vim.t.bufs) do
    local other = filename(api.nvim_buf_get_name(bufnr))

    if index ~= i and other == name then
      return fn.fnamemodify(api.nvim_buf_get_name(vim.t.bufs[index]), ":h:t") .. "/" .. name
    end
  end
end

local function style_buf(bufnr, index, width)
  local is_current = api.nvim_get_current_buf() == bufnr
  local hl = "BufO" .. (is_current and "n" or "ff")
  local icon = "󰈚 "
  local icon_hl = new_hl("DevIconDefault", hl)
  local name = filename(api.nvim_buf_get_name(bufnr))

  name = name and (unique_name(name, index) or name) or "No Name"

  if name ~= "No Name" then
    local devicon, devicon_hl = require("nvim-web-devicons").get_icon(name)

    if devicon then
      icon = " " .. devicon .. " "
      icon_hl = new_hl(devicon_hl, hl)
    end
  end

  local max_name = width - 7
  name = string.sub(name, 1, max_name - 2) .. (#name > max_name and ".." or "")

  local pad = math.floor((width - #name - 7) / 2)
  pad = pad <= 0 and 1 or pad

  local label = strep(" ", pad - 1) .. icon_hl .. icon .. txt(name, hl) .. strep(" ", pad - 1)
  label = btn(label, nil, "GoToBuf", bufnr)

  local modified = get_opt("mod", { buf = bufnr })
  local current_modified = get_opt("mod", { buf = 0 })
  local close = btn(" × ", nil, "KillBuf", bufnr)

  if is_current then
    close = current_modified and txt(" ● ", "BufOnModified") or txt(close, "BufOnClose")
  else
    close = modified and txt(" ● ", "BufOffModified") or txt(close, "BufOffClose")
  end

  return txt(label .. close, hl)
end

M.buffers = function()
  local opts = require("nvconfig").ui.tabufline
  local buffers = {}
  local has_current = false
  local max_buffers = math.max(math.floor((vim.o.columns - 14) / opts.bufwidth), 1)

  vim.t.bufs = vim.tbl_filter(api.nvim_buf_is_valid, vim.t.bufs)

  for index, bufnr in ipairs(vim.t.bufs) do
    if #buffers >= max_buffers then
      if has_current then
        break
      end

      table.remove(buffers, 1)
    end

    has_current = api.nvim_get_current_buf() == bufnr or has_current
    table.insert(buffers, style_buf(bufnr, index, opts.bufwidth))
  end

  return table.concat(buffers) .. txt("%=", "Fill")
end

M.btns = function()
  return btn("  Close All × ", "CloseAllBufsBtn", "CloseAllBufs")
end

return M
