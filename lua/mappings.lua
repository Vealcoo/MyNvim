require "nvchad.mappings"

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode", nowait = true })
map("n", "<leader>nt", "<cmd>tabnew<CR>", { desc = "Open new tab" })
map("n", "<leader>]", "<C-w>w", { desc = "Next window" })
map("n", "<leader>[", "<C-w>W", { desc = "Previous window" })
map(
  "n",
  "<leader><leader>",
  "<cmd>lua require('nvchad_ui.tabufline').closeAllBufs()<CR>",
  { desc = "Close all buffers" }
)

map("i", "jk", "<ESC>", { desc = "Escape vim" })
map("i", "<C-v>", "<ESC>pa", { desc = "Paste in insert mode" })

map("v", "<C-c>", "y", { desc = "Copy in visual mode" })
map("v", "<C-v>", "p", { desc = "Paste in visual mode" })
map("x", "<C-c>", "y", { desc = "Copy in visual block mode" })
map("x", "<C-v>", "p", { desc = "Paste in visual block mode" })
map("t", "<C-v>", "<C-\\><C-n>pa", { desc = "Paste in terminal mode" })

map("n", "<leader>e", function()
  Snacks.explorer()
end, { desc = "Snacks explorer" })
map("n", "<C-n>", function()
  Snacks.explorer()
end, { desc = "Snacks explorer" })
map("n", "ww", function()
  Snacks.explorer()
end, { desc = "Snacks explorer" })

map("n", "<leader><space>", function()
  Snacks.picker.smart()
end, { desc = "Smart find" })
map("n", "<leader>ff", function()
  Snacks.picker.files()
end, { desc = "Find files" })
map("n", "<leader>fg", function()
  Snacks.picker.grep()
end, { desc = "Live grep" })
map("n", "<leader>fb", function()
  Snacks.picker.buffers()
end, { desc = "Find buffers" })
map("n", "<leader>fr", function()
  Snacks.picker.recent()
end, { desc = "Recent files" })
map("n", "<leader>fp", function()
  Snacks.picker.projects()
end, { desc = "Projects" })
map("n", "<leader>fl", function()
  Snacks.picker.lines()
end, { desc = "Buffer lines" })

map("n", "<leader>cu", "<cmd>TSCaptureUnderCursor<CR>", { desc = "Find media" })

map("n", "git", "<cmd>Gitsigns diffthis<CR>", { desc = "Git diff" })
map("n", "\\", "<cmd>Gitsigns toggle_current_line_blame<CR>", { desc = "Git line blame" })
map("n", "<leader>gg", function()
  Snacks.lazygit()
end, { desc = "LazyGit" })
map("n", "<leader>gb", function()
  Snacks.gitbrowse()
end, { desc = "Git browse" })

map("n", "err", "<cmd>Trouble diagnostics toggle win.position=right<CR>", { desc = "Trouble toggle" })
map("n", "<leader>dd", function()
  Snacks.picker.diagnostics_buffer()
end, { desc = "Diagnostics current buffer" })
map("n", "<leader>dD", function()
  Snacks.picker.diagnostics()
end, { desc = "Diagnostics workspace" })
map("n", "<leader>dt", "<cmd>Trouble diagnostics toggle focus=false filter.buf=0 win.position=right<CR>", { desc = "Trouble buffer diagnostics" })
map("n", "<leader>dT", "<cmd>Trouble diagnostics toggle focus=false win.position=right<CR>", { desc = "Trouble workspace diagnostics" })
map("n", "<leader>df", vim.diagnostic.open_float, { desc = "Diagnostic float" })
map("n", "<leader>dq", function()
  vim.diagnostic.setqflist { open = true }
end, { desc = "Diagnostics quickfix" })
map("n", "[d", function()
  vim.diagnostic.jump { count = -1, float = true }
end, { desc = "Previous diagnostic" })
map("n", "]d", function()
  vim.diagnostic.jump { count = 1, float = true }
end, { desc = "Next diagnostic" })
map("n", "[e", function()
  vim.diagnostic.jump { count = -1, severity = vim.diagnostic.severity.ERROR, float = true }
end, { desc = "Previous error" })
map("n", "]e", function()
  vim.diagnostic.jump { count = 1, severity = vim.diagnostic.severity.ERROR, float = true }
end, { desc = "Next error" })
map("n", "ee", "<cmd>Trouble symbols toggle focus=false win.position=right<CR>", { desc = "Document symbols" })
map("n", "<leader>lr", "<cmd>Trouble lsp toggle focus=false win.position=right<CR>", { desc = "LSP references" })
map("n", "<leader>w", function()
  require("flash").jump()
end, { desc = "Flash jump" })
map("n", "<leader>W", function()
  require("flash").treesitter()
end, { desc = "Flash treesitter" })

map("n", "test", "<cmd>TestNearest<CR>", { desc = "Run single test" })

map("n", "dir", function()
  Snacks.picker.projects()
end, { desc = "Project switcher" })

map("n", "<leader>aa", "<cmd>CodeCompanionActions<CR>", { desc = "AI actions" })
map("n", "<leader>ac", "<cmd>CodeCompanionChat Toggle<CR>", { desc = "AI chat" })
map("v", "<leader>ac", "<cmd>CodeCompanionChat Add<CR>", { desc = "AI chat selection" })
map({ "n", "v" }, "<leader>ai", "<cmd>CodeCompanion<CR>", { desc = "AI inline" })
map("n", "<leader>ao", "<cmd>CodeCompanionCLI agent=codex<CR>", { desc = "AI Codex CLI" })
map({ "n", "v" }, "<leader>aq", function()
  require("codecompanion").cli({ agent = "codex", prompt = true })
end, { desc = "AI Codex prompt" })
map({ "n", "v" }, "<leader>ax", function()
  require("codecompanion").cli("#{this}", { agent = "codex", focus = false })
end, { desc = "AI Codex add context" })
map("n", "<leader>ad", function()
  require("codecompanion").cli("#{diagnostics} Can you fix these diagnostics?", { agent = "codex", focus = false, submit = true })
end, { desc = "AI Codex diagnostics" })
map("n", "<leader>at", function()
  require("codecompanion").cli(
    "#{terminal} Sharing the latest terminal output. Can you inspect it and suggest or apply a fix?",
    { agent = "codex", focus = false, submit = true }
  )
end, { desc = "AI Codex terminal output" })
map("n", "<leader>au", "<cmd>Copilot auth<CR>", { desc = "Copilot auth" })
map("n", "<leader>ap", "<cmd>Copilot panel<CR>", { desc = "Copilot panel" })

map("v", "<leader>c", "<Plug>OSCYankVisual", { desc = "Oscyank" })

map({ "n", "v" }, "<RightMouse>", function()
  require("menu.utils").delete_old_menus()
  vim.cmd.exec '"normal! \\<RightMouse>"'
  local options = "default"
  require("menu").open(options, { mouse = true })
end, { desc = "Open context menu with right click" })
