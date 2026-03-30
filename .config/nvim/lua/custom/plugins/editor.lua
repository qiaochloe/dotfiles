-- Plugins for editor behavior
return {
  { -- Autopairs
    -- https://github.com/windwp/nvim-autopairs
    'windwp/nvim-autopairs',
    event = 'InsertEnter',
    config = true,
    opts = {},
  },

  { -- Autotags
    'windwp/nvim-ts-autotag',
    config = function()
      require('nvim-ts-autotag').setup {
        opts = {
          enable_close = true, -- Auto close tags
          enable_rename = true, -- Auto rename pairs of tags
          enable_close_on_slash = false, -- Auto close on trailing </
        },
      }
    end,
  },

  { -- Prevent cursor from moving while yanking
    'svban/YankAssassin.nvim',
    config = function()
      require('YankAssassin').setup {
        auto_normal = true,
        auto_visual = true,
      }
    end,
  },

  { -- Folding
    'kevinhwang91/nvim-ufo',
    dependencies = { 'kevinhwang91/promise-async' },
    config = function()
      -- Use nvim lsp as lsp client
      local capabilities = vim.lsp.protocol.make_client_capabilities()
      capabilities.textDocument.foldingRange = {
        dynamicRegistration = false,
        lineFoldingOnly = true,
      }
      local language_servers = vim.lsp.get_clients()
      for _, ls in ipairs(language_servers) do
        require('lspconfig')[ls].setup {
          capabilities = capabilities,
        }
      end

      local ufo = require 'ufo'
      ufo.setup()
      vim.keymap.set('n', 'zR', ufo.openAllFolds)
      vim.keymap.set('n', 'zM', ufo.closeAllFolds)
    end,
  },

  { -- Commenting
    'nvim-mini/mini.comment',
    event = 'VeryLazy',
    opts = {
      options = {
        custom_commentstring = function() return require('ts_context_commentstring.internal').calculate_commentstring() or vim.bo.commentstring end,
      },
    },
  },

  { -- Commenting
    'folke/ts-comments.nvim',
    event = 'VeryLazy',
    opts = {},
  },

  { -- Change comment type depending on context
    'JoosepAlviste/nvim-ts-context-commentstring',
    lazy = true,
    opts = {
      enable_autocmd = false,
    },
  },

  { -- Gutter marks
    'dimtion/guttermarks.nvim',
    event = { 'BufReadPost', 'BufNewFile', 'BufWritePre', 'FileType' },
  },

  { -- Indent
    'NMAC427/guess-indent.nvim',
    opts = {},
  },

  { -- Tabout parens, brackets, quotes, etc
    'abecodes/tabout.nvim',
    lazy = false,
    opt = true,
    event = 'InsertCharPre',
    priority = 1000,
    config = function()
      require('tabout').setup {
        tabkey = '<Tab>',
        backwards_tabkey = '', -- Disabled
        act_as_tab = true, -- Shift content if tab out is not possible
        act_as_shift_tab = false, -- Reverse shift content if tab out is not possible
        default_tab = '<C-t>', -- Shift default action
        default_shift_tab = '<C-d>', -- Reverse shift default action
        enable_backwards = true,
        completion = false, -- if the tabkey is used in a completion
        tabouts = {
          { open = "'", close = "'" },
          { open = '"', close = '"' },
          { open = '`', close = '`' },
          { open = '(', close = ')' },
          { open = '[', close = ']' },
          { open = '{', close = '}' },
        },
        -- If the cursor is at the beginning of a filled element
        -- it will rather tab out than shift the content
        ignore_beginning = true,
        exclude = {},
      }
    end,
    dependencies = { -- These are optional
      'nvim-treesitter/nvim-treesitter',
      'L3MON4D3/LuaSnip',
      'hrsh7th/nvim-cmp',
    },
  },
}
