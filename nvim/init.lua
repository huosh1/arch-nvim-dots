-- Leader
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Affichage simple
vim.opt.number = true
vim.opt.termguicolors = true   -- active les couleurs vraies (sans thème)
vim.cmd("syntax on")           -- coloration basique intégrée
vim.opt.fillchars:append({ eob = "~" }) -- remets les ~
vim.opt.list = false

-- Indentation simple
vim.opt.expandtab = true
vim.opt.shiftwidth = 2
vim.opt.tabstop = 2

-- Bootstrap lazy.nvim (gestionnaire de plugins)
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({ "git", "clone", "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git", "--branch=stable", lazypath })
end
vim.opt.rtp:prepend(lazypath)

-- Charge TES plugins depuis lua/plugins/
require("lazy").setup("plugins")

-- Raccourcis fenêtres (splits)
local map = vim.keymap.set
map("n", "<leader>sv", "<cmd>vsplit<cr>", { desc = "Split vertical" })
map("n", "<leader>sh", "<cmd>split<cr>",  { desc = "Split horizontal" })
map("n", "<C-h>", "<C-w>h", { silent = true })
map("n", "<C-j>", "<C-w>j", { silent = true })
map("n", "<C-k>", "<C-w>k", { silent = true })
map("n", "<C-l>", "<C-w>l", { silent = true })

