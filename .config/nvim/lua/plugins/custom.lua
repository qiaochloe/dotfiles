return {
  { -- Autopair parens, brackets, quotes, etc
    "windwp/nvim-autopairs",
    event = "InsertEnter",
    config = function()
      require("nvim-autopairs").setup()
      -- Pair $ with $ in LaTeX and Typst
      local npairs = require("nvim-autopairs")
      local Rule = require("nvim-autopairs.rule")
      npairs.add_rules({
        Rule("$", "$", { "typ", "tex", "latex", "typst" })
          -- Ensure it doesn't pair inside an existing $$
          :with_pair(function(opts)
            local line = opts.line
            local col = opts.col
            return line:sub(col - 1, col - 1) ~= "$"
          end)
          -- Move right if the next character is `$`
          :with_move(function(opts)
            return opts.next_char == "$"
          end),
        -- Allow deletion only if both `$` are present
        -- :with_del(function(opts)
        --   local prev_char = opts.prev_char
        --   local next_char = opts.next_char
        --   return prev_char == '$' and next_char == '$'
        -- end)
        -- :use_key '$$',
      })
    end,
  },
  { -- More languages to treesitter
    -- And disable syntax highlighting for LaTeX
    "nvim-treesitter/nvim-treesitter",
    opts = function(_, opts)
      vim.list_extend(opts.ensure_installed, {
        "rust",
        "tsx",
        "typescript",
        "typst",
      })
      vim.list_extend(opts.highlight, {
        additional_vim_regex_highlighting = { "latex" },
      })
    end,
  },
  { -- After yank, the cursor does not move back to start
    "svban/YankAssassin.nvim",
    config = function()
      require("YankAssassin").setup({
        auto_normal = true, -- if true, autocmds are used. Whenever y is used in normal mode, the cursor doesn't move to start
        auto_visual = true, -- if true, autocmds are used. Whenever y is used in visual mode, the cursor doesn't move to start
      })
    end,
  },
  { -- Splitting manager that works with wezterm
    -- Keymaps are in `lua/config/keymaps.lua`
    "mrjones2014/smart-splits.nvim",
    lazy = false,
  },
}
