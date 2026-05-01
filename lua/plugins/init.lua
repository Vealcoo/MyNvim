return {
  {
    "stevearc/conform.nvim",
    opts = require "configs.conform",
  },

  {
    "neovim/nvim-lspconfig",
    config = function()
      require "configs.lspconfig"
    end,
  },

  {
    "nvim-tree/nvim-tree.lua",
    enabled = false,
  },

  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = {
        "vim",
        "lua",
        "vimdoc",
        "html",
        "css",
        "javascript",
        "json",
        "toml",
        "markdown",
        "c",
        "json",
        "typescript",
        "go",
        "regex",
      },
    },
  },

  {
    "nvzone/volt",
    lazy = false,
  },

  {
    "nvzone/menu",
    lazy = false,
  },

  {
    "folke/snacks.nvim",
    priority = 1000,
    lazy = false,
    opts = require "configs.snacks",
  },

  {
    "max397574/better-escape.nvim",
    event = "InsertEnter",
    config = function()
      require("better_escape").setup()
    end,
  },

  {
    "folke/trouble.nvim",
    opts = {
      pinned = true,
      warn_no_results = false, -- show a warning when there are no results
      open_no_results = true, -- open the trouble window when there are no results
    },
    cmd = "Trouble",
  },

  {
    "folke/flash.nvim",
    event = "VeryLazy",
    opts = {},
  },

  {
    "ellisonleao/glow.nvim",
    config = function()
      require("glow").setup()
    end,
  },

  {
    "zbirenbaum/copilot.lua",
    cmd = "Copilot",
    event = "InsertEnter",
    config = function()
      require("copilot").setup {
        panel = { enabled = true },
        suggestion = {
          enabled = true,
          auto_trigger = true,
          keymap = {
            accept = "<M-l>",
            next = "<M-]>",
            prev = "<M-[>",
            dismiss = "<C-]>",
          },
        },
      }
    end,
  },

  {
    "olimorris/codecompanion.nvim",
    cmd = { "CodeCompanion", "CodeCompanionChat", "CodeCompanionActions" },
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-treesitter/nvim-treesitter",
      "zbirenbaum/copilot.lua",
    },
    opts = require "configs.codecompanion",
  },

  {
    -- this plugin needs to setup by self
    "iamcco/markdown-preview.nvim",
    lazy = false,
  },

  {
    "klen/nvim-test",
    lazy = false,
    config = function()
      require("nvim-test").setup()
    end,
  },

  {
    "folke/noice.nvim",
    lazy = false,
    config = function()
      require("noice").setup {
        messages = {
          view = "mini",
        },
        lsp = {
          progress = {
            enabled = true,
            view = "mini",
          },
          override = {
            ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
            ["vim.lsp.util.stylize_markdown"] = true,
            ["cmp.entry.get_documentation"] = true,
          },
        },
        views = {
          mini = {
            position = {
              row = -2,
              col = -2,
            },
          },
        },
        presets = {
          bottom_search = true, -- use a classic bottom cmdline for search
          command_palette = true, -- position the cmdline and popupmenu together
          long_message_to_split = false, -- long messages will be sent to a split
          inc_rename = false, -- enables an input dialog for inc-rename.nvim
          lsp_doc_border = false, -- add a border to hover docs and signature help
        },
        popupmenu = {
          enabled = true,
          backend = "nui",
        },
      }
    end,
    dependencies = {
      "MunifTanjim/nui.nvim",
      "rcarriga/nvim-notify",
    },
  },

  {
    "folke/todo-comments.nvim",
    lazy = false,
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      require("todo-comments").setup()
    end,
  },

  {
    "ojroques/vim-oscyank",
    lazy = false,
  },

  {
    "Pocco81/auto-save.nvim",
    lazy = false,
    config = function()
      require("auto-save").setup {
        enabled = true,
        execution_message = {
          message = function()
            return ""
          end,
        },
        condition = function(buf)
          local buf_type = vim.api.nvim_buf_get_option(buf, "buftype")
          return buf_type ~= "nofile" and buf_type ~= "terminal"
        end,
        trigger_events = { "InsertLeave", "TextChanged" },
        filetypes = { "*" },
      }
    end,
  },
}
