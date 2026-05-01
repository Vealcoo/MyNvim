-- Compatibility shims for plugins that still call deprecated Neovim APIs.
if vim.lsp and vim.lsp.get_clients then
  vim.lsp.buf_get_clients = function(bufnr)
    if type(bufnr) == "table" then
      return vim.lsp.get_clients(bufnr)
    end

    return vim.lsp.get_clients { bufnr = bufnr or 0 }
  end
end
