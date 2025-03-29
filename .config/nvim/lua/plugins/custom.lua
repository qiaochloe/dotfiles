return {
  {
    "jake-stewart/multicursor.nvim",
    branch = "1.0",
    config = function()
      local mc = require("multicursor-nvim")
      mc.setup()

      local set = vim.keymap.set

      -- Add a new cursor by matching word/selection
      set({ "n", "x" }, "<leader>n", function()
        mc.matchAddCursor(1)
      end)
      set({ "n", "x" }, "<leader>N", function()
        mc.matchAddCursor(-1)
      end)

      -- Add a cursor for all matches of cursor word/selection in the document.
      set({ "n", "x" }, "<leader>A", mc.matchAllAddCursors)

      -- Append/insert for each line of visual selections.
      -- Similar to block selection insertion.
      set("x", "I", mc.insertVisual)
      set("x", "A", mc.appendVisual)

      -- Add and remove cursors with control + left click.
      set("n", "<c-leftmouse>", mc.handleMouse)
      set("n", "<c-leftdrag>", mc.handleMouseDrag)
      set("n", "<c-leftrelease>", mc.handleMouseRelease)

      -- Disable and enable cursors.
      set({ "n", "x" }, "<c-q>", mc.toggleCursor)

      -- Mappings defined in a keymap layer only apply when there are
      -- multiple cursors. This lets you have overlapping mappings.
      mc.addKeymapLayer(function(layerSet)
        -- Select a different cursor as the main one.
        layerSet({ "n", "x" }, "<left>", mc.prevCursor)
        layerSet({ "n", "x" }, "<right>", mc.nextCursor)

        -- Delete the main cursor.
        layerSet({ "n", "x" }, "<leader>x", mc.deleteCursor)

        -- Enable and clear cursors using escape.
        layerSet("n", "<esc>", function()
          if not mc.cursorsEnabled() then
            mc.enableCursors()
          else
            mc.clearCursors()
          end
        end)
      end)

      -- Customize how cursors look.
      local hl = vim.api.nvim_set_hl
      hl(0, "MultiCursorCursor", { link = "Cursor" })
      hl(0, "MultiCursorVisual", { link = "Visual" })
      hl(0, "MultiCursorSign", { link = "SignColumn" })
      hl(0, "MultiCursorMatchPreview", { link = "Search" })
      hl(0, "MultiCursorDisabledCursor", { link = "Visual" })
      hl(0, "MultiCursorDisabledVisual", { link = "Visual" })
      hl(0, "MultiCursorDisabledSign", { link = "SignColumn" })
    end,
  },
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
}
