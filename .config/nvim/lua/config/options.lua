-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

-- Disable some default options from LazyVim
vim.g.snacks_animate = false
vim.g.lazyvim_picker = "telescope" -- As opposed to fzf

vim.opt.encoding = "utf-8"
vim.opt.fileencoding = "utf-8"

vim.opt.relativenumber = false
vim.opt.breakindent = true
vim.opt.conceallevel = 0 -- Don't hide * markup in markdown files
vim.opt.wrap = true
