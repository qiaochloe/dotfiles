return {
  { -- Disable f mappings
    "nvim-telescope/telescope.nvim",
    keys = {
      { "<leader>fb", false },
      { "<leader>fc", false },
      { "<leader>fr", false },
      { "<leader>fR", false },
      { "<leader>ff", false },
      { "<leader>fF", false },
      { "<leader>fg", false },
      { "<leader>sf", "<cmd>Telescope find_files<cr>", desc = "File Files" },
    },
  },
  { -- Disable f mappings and e mappings
    "nvim-neo-tree/neo-tree.nvim",
    keys = {
      { "<leader>e", false },
      { "<leader>E", false },
      { "<leader>fe", false },
      { "<leader>fE", false },
      {
        "<leader>ue",
        function()
          require("neo-tree.command").execute({ toggle = true, dir = LazyVim.root() })
        end,
        desc = "Explorer NeoTree (Root Dir)",
      },
      {
        "<leader>uE",
        function()
          require("neo-tree.command").execute({ toggle = true, dir = vim.uv.cwd() })
        end,
        desc = "Explorer NeoTree (cwd)",
      },
    },
  },
}
