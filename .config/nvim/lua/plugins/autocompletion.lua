return {
  { -- Configure nvim-cmp
    "hrsh7th/nvim-cmp",
    ---@param opts cmp.ConfigSchema
    opts = function(_, opts)
      --[[ 
      local has_words_before = function()
        unpack = unpack or table.unpack
        local line, col = unpack(vim.api.nvim_win_get_cursor(0))
        return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
      end
      --]]
      local cmp = require("cmp")
      opts.mapping = vim.tbl_extend("force", opts.mapping, {
        -- Disable autocmpletion on enter
        ["<CR>"] = cmp.config.disable,
        --[[
        ["<Tab>"] = cmp.mapping(function(fallback)
          if cmp.visible() then
            -- You could replace select_next_item() with confirm({ select = true }) to get VS Code autocompletion behavior
            cmp.select_next_item()
          elseif vim.snippet.active({ direction = 1 }) then
            vim.schedule(function()
              vim.snippet.jump(1)
            end)
          elseif has_words_before() then
            cmp.complete()
          else
            fallback()
          end
        end, { "i", "s" }),
        ["<S-Tab>"] = cmp.mapping(function(fallback)
          if cmp.visible() then
            cmp.select_prev_item()
          elseif vim.snippet.active({ direction = -1 }) then
            vim.schedule(function()
              vim.snippet.jump(-1)
            end)
          else
            fallback()
          end
        end, { "i", "s" }),
        --]]
      })
    end,
  },
  { -- Have copilot show ghost text instead of suggestions in the completion menu
    "zbirenbaum/copilot.lua",
    event = "InsertEnter",
    opts = {
      suggestion = {
        enabled = true,
        auto_trigger = true,
        keymap = {
          accept = "<Tab>",
        },
      },
    },
  },
  { -- Tabout
    -- Used a recipe to use neotab with nvim-cmp
    "kawre/neotab.nvim",
    event = "InsertEnter",
    opts = {
      -- tabkey = "",
    },
  },
  -- { -- Tabout
  --   "abecodes/tabout.nvim",
  --   lazy = false,
  --   event = "InsertCharPre",
  --   config = true,
  --   opts = {
  --     tabouts = {
  --       { open = "'", close = "'" },
  --       { open = '"', close = '"' },
  --       { open = "`", close = "`" },
  --       { open = "(", close = ")" },
  --       { open = "[", close = "]" },
  --       { open = "{", close = "}" },
  --       { open = "$", close = "$" },
  --     },
  --   },
  -- },
  { -- Prevent copilot from showing suggestions in the completion menu
    "zbirenbaum/copilot-cmp",
    enabled = false,
  },
  { -- Remove snippets
    "garymjr/nvim-snippets",
    enabled = false,
  },
  { -- Really remove snippets
    "rafamadriz/friendly-snippets",
    enabled = false,
  },
  { -- Disable default tab keybinding in LuaSnip
    -- For tabout and cmp
    "L3MON4D3/LuaSnip",
    keys = function()
      return {}
    end,
  },
}
