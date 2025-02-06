-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- Replace the default keymaps for moving between splits
-- With the smart-splits keymaps that work with wezterm
vim.keymap.del("n", "<C-h>")
vim.keymap.del("n", "<C-j>")
vim.keymap.del("n", "<C-k>")
vim.keymap.del("n", "<C-l>")

vim.keymap.set("n", "<C-h>", require("smart-splits").move_cursor_left)
vim.keymap.set("n", "<C-j>", require("smart-splits").move_cursor_down)
vim.keymap.set("n", "<C-k>", require("smart-splits").move_cursor_up)
vim.keymap.set("n", "<C-l>", require("smart-splits").move_cursor_right)

-- Remove keymaps starting with f
-- To use <leader>f for formatting
vim.keymap.del("n", "<leader>fn")
vim.keymap.del("n", "<leader>ft")
vim.keymap.del("n", "<leader>fT")

vim.keymap.set({ "n", "v" }, "<leader>f", function()
  LazyVim.format({ force = true })
end, { desc = "Format" })

-- Use <leader>e for error messages
vim.keymap.set("n", "<leader>e", vim.diagnostic.open_float, { desc = "Line Diagnostics" })

-- Map U to redo
vim.keymap.set("n", "U", "<C-R>", { desc = "Redo last change" })
