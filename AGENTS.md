# AGENTS.md

## Project

This repository is a personal Neovim configuration based on NvChad v2.5.
Keep changes small, Lua-first, and consistent with the existing files under
`lua/configs`, `lua/plugins`, `lua/mappings.lua`, and `lua/options.lua`.

## Working Rules

- Prefer existing NvChad and plugin configuration patterns over new frameworks.
- Use `rg` / `rg --files` for code search.
- Do not modify `lazy-lock.json` unless the task explicitly updates plugins.
- Do not revert unrelated local changes.
- Use `vim.keymap.set` mappings with clear `desc` values.
- Keep plugin specs in `lua/plugins/init.lua` and larger plugin options in
  `lua/configs/*.lua`.

## Verification

- For Lua syntax/config checks, run:

```sh
nvim --headless "+Lazy! sync" +qa
```

- For lightweight local checks, run:

```sh
nvim --headless "+lua require('configs.codecompanion')" +qa
```

The local Neovim state directory may be sandbox-restricted in some automation
environments, so report those permission errors instead of working around them.
