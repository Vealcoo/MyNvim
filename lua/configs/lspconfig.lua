-- load defaults i.e lua_lsp
require("nvchad.configs.lspconfig").defaults()

local servers = { "html", "cssls", "clangd", "jsonls", "ts_ls", "tailwindcss", "bashls", "gopls" }
local nvlsp = require "nvchad.configs.lspconfig"

for _, server in ipairs(servers) do
  vim.lsp.config(server, {
    capabilities = nvlsp.capabilities,
    on_init = nvlsp.on_init,
  })
  vim.lsp.enable(server)
end

-- configuring single server, example: typescript
-- vim.lsp.config("ts_ls", {
--   on_init = nvlsp.on_init,
--   capabilities = nvlsp.capabilities,
-- })
-- vim.lsp.enable "ts_ls"
