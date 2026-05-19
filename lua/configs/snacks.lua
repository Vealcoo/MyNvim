return {
  animate = { enabled = false },
  bigfile = { enabled = true },
  dashboard = { enabled = false },
  explorer = {
    enabled = true,
    replace_netrw = true,
  },
  gitbrowse = { enabled = true },
  indent = { enabled = false },
  input = { enabled = true },
  lazygit = { enabled = true },
  notifier = { enabled = false },
  picker = {
    enabled = true,
    sources = {
      files = {
        cmd = vim.fn.executable "fd" == 1 and "fd" or "rg",
        hidden = true,
      },
      explorer = {
        hidden = true,
      },
    },
  },
  quickfile = { enabled = true },
  scope = { enabled = true },
  scroll = { enabled = true },
  statuscolumn = { enabled = false },
  terminal = { enabled = true },
  words = { enabled = true },
}
