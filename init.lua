
vim.loader.enable()

vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

vim.opt.number = true
vim.opt.relativenumber = true

vim.keymap.set("n", "<leader>l", ":Ex<CR>")
vim.keymap.set("n", "<leader>s", ":source %<CR>")
vim.keymap.set("n", "<leader>r", ":restart edit %<CR>")

vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>', {desc="Clear search highlists"})

vim.pack.add { { src = "https://github.com/catppuccin/nvim", name = "catppuccin" } }

vim.cmd.colorscheme "catppuccin-macchiato" -- catppuccin-latte, catppuccin-frappe, catppuccin-macchiato, catppuccin-mocha
