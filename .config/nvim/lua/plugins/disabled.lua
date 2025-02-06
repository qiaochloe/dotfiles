return {
  { -- Replace blink with nvim-cmp
    "saghen/blink.cmp",
    enabled = false,
  },
  { -- Replace mini.pairs with nvim-autopairs
    "echasnovski/mini.pairs",
    enabled = false,
  },
  { -- Disable vertical indent lines animation, smooth scrolling, dashboard
    "folke/snacks.nvim",
    opts = {
      dashboard = {
        enabled = false,
      },
      indent = {
        animate = {
          enabled = false,
        },
      },
      scroll = {
        enabled = false,
      },
    },
  },
  { -- Disable status line
    "nvim-lualine/lualine.nvim",
    enabled = false,
  },
  { -- Disable messages, command line, and pop-up menu
    "folke/noice.nvim",
    enabled = false,
  },
  { -- Disable fancy tab pages
    "akinsho/bufferline.nvim",
    enabled = false,
  },
  { -- Disable inlay hints
    "neovim/nvim-lspconfig",
    opts = {
      inlay_hints = { enabled = false },
    },
  },
  { -- Disable icons
    "echasnovski/mini.icons",
    enabled = false,
  },
  { -- Disable which-key
    "folke/which-key.nvim",
    event = "VeryLazy",
    opts_extend = { "spec" },
    opts = function(_, opts)
      opts.spec = {
        mode = { "n", "v" },
        { "<leader><tab>", group = "tabs" },
        { "<leader>c", group = "code" },
        { "<leader>d", group = "debug" },
        { "<leader>dp", group = "profiler" },
        -- { "<leader>f", group = "file/find" },
        { "<leader>g", group = "git" },
        { "<leader>gh", group = "hunks" },
        { "<leader>q", group = "quit/session" },
        { "<leader>s", group = "search" },
        { "<leader>u", group = "ui", icon = { icon = "󰙵 ", color = "cyan" } },
        { "<leader>x", group = "diagnostics/quickfix", icon = { icon = "󱖫 ", color = "green" } },
        { "[", group = "prev" },
        { "]", group = "next" },
        { "g", group = "goto" },
        { "gs", group = "surround" },
        { "z", group = "fold" },
        {
          "<leader>b",
          group = "buffer",
          expand = function()
            return require("which-key.extras").expand.buf()
          end,
        },
        {
          "<leader>w",
          group = "windows",
          proxy = "<c-w>",
          expand = function()
            return require("which-key.extras").expand.win()
          end,
        },
        -- better descriptions
        { "gx", desc = "Open with system app" },
      }
      opts.icons = {
        mappings = false,
      }
    end,
  },
}
