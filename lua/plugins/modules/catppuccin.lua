local gh = require('plugins.lib.sources').gh
vim.pack.add { { src = gh("catppuccin/nvim"), name = "catppuccin" } }
vim.pack.add { gh("nvim-tree/nvim-web-devicons") }

vim.cmd.colorscheme "catppuccin-mocha" -- catppuccin-latte, catppuccin-frappe, catppuccin-macchiato, catppuccin-mocha
