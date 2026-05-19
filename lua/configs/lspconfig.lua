-- load defaults i.e lua_lsp
require("nvchad.configs.lspconfig").defaults()

local servers = {
  html = { executable = "vscode-html-language-server" },
  cssls = { executable = "vscode-css-language-server" },
  clangd = { executable = "clangd" },
  jsonls = { executable = "vscode-json-language-server" },
  ts_ls = { executable = "typescript-language-server" },
  tailwindcss = {
    executable = "tailwindcss-language-server",
    root_markers = {
      "tailwind.config.js",
      "tailwind.config.cjs",
      "tailwind.config.mjs",
      "tailwind.config.ts",
      "postcss.config.js",
      "postcss.config.cjs",
    },
  },
  bashls = { executable = "bash-language-server" },
  gopls = { executable = "gopls" },
}
local nvlsp = require "nvchad.configs.lspconfig"

for server, config in pairs(servers) do
  if vim.fn.executable(config.executable) == 1 then
    vim.lsp.config(server, {
      capabilities = nvlsp.capabilities,
      on_init = nvlsp.on_init,
    })
    vim.lsp.enable(server)
  end
end

-- configuring single server, example: typescript
-- vim.lsp.config("ts_ls", {
--   on_init = nvlsp.on_init,
--   capabilities = nvlsp.capabilities,
-- })
-- vim.lsp.enable "ts_ls"
