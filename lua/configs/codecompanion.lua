local function resolve_codex_cmd()
  local function is_editor_extension_cmd(cmd)
    return cmd:find("/extensions/openai%.chatgpt%-", 1) ~= nil
  end

  if vim.env.CODEX_CMD and vim.fn.executable(vim.env.CODEX_CMD) == 1 then
    return vim.env.CODEX_CMD
  end

  local cmd = vim.fn.exepath "codex"
  if cmd ~= "" and not is_editor_extension_cmd(cmd) then
    return cmd
  end

  return "codex"
end

local codex_cmd = resolve_codex_cmd()

return {
  display = {
    action_palette = {
      provider = "snacks",
    },
    cli = {
      window = {
        layout = "vertical",
        width = 0.42,
      },
    },
  },
  interactions = {
    chat = {
      adapter = "copilot",
    },
    inline = {
      adapter = "copilot",
    },
    cmd = {
      adapter = "copilot",
    },
    cli = {
      agent = "codex",
      agents = {
        codex = {
          cmd = codex_cmd,
          args = {},
          description = "OpenAI Codex CLI",
          provider = "terminal",
        },
      },
      opts = {
        auto_insert = true,
        reload = true,
      },
    },
  },
}
