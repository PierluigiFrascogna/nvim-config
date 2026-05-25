
vim.loader.enable()

vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.wildmode = "longest:full"
vim.opt.signcolumn = "yes"
vim.opt.undofile = true
vim.opt.breakindent = true
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.timeout = true
vim.opt.timeoutlen = 10000
vim.opt.updatetime = 250
vim.opt.list = true
vim.opt.listchars = {
	eol = ' ', -- if you want some option: ↲, ↵,
	multispace = '␣',
        lead = '·',
        leadmultispace = '··',
	tab = '  ⇥',
	leadtab = '>>',
	trail = '␣',
	nbsp = '␣',
	precedes = '<',
	extends = '>',
	conceal = '#',
}
vim.opt.inccommand = 'split'
vim.opt.cursorline = false
vim.opt.scrolloff = 10
vim.opt.confirm = false

vim.keymap.set("n", "<leader>l", ":Ex<Enter>")
vim.keymap.set("n", "<leader>s", ":w<Enter>:source %<Enter>")
vim.keymap.set("n", "<leader>r", ":restart edit %<CR>")

vim.keymap.set('n', '<left>', '<cmd>echo "Use h to move!!"<CR>')
vim.keymap.set('n', '<right>', '<cmd>echo "Use l to move!!"<CR>')
vim.keymap.set('n', '<up>', '<cmd>echo "Use k to move!!"<CR>')
vim.keymap.set('n', '<down>', '<cmd>echo "Use j to move!!"<CR>')

vim.keymap.set('n', '<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
vim.keymap.set('n', '<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
vim.keymap.set('n', '<C-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
vim.keymap.set('n', '<C-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })

vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>', { desc="Clear search highlists" } )

vim.api.nvim_create_autocmd('TextYankPost', {
	desc = 'Highlight when yanking (copying) text',
	group = vim.api.nvim_create_augroup('highlight-yank', { clear = true }),
	callback = function() vim.hl.on_yank() end,
})

local function gh(repo) return "https://github.com/" .. repo end
vim.pack.add { { src = gh("catppuccin/nvim"), name = "catppuccin" } }
vim.pack.add { gh("nvim-tree/nvim-web-devicons") }
vim.pack.add { gh 'lewis6991/gitsigns.nvim' }

vim.pack.add { gh 'folke/which-key.nvim' } -- Useful plugin to show you pending keybinds.
require('which-key').setup {
	-- Delay between pressing a key and opening which-key (milliseconds)
	delay = 2000,
	icons = { mappings = vim.g.have_nerd_font },
}

vim.pack.add { gh 'folke/todo-comments.nvim' }
require('todo-comments').setup { signs = false }

vim.cmd.colorscheme "catppuccin-mocha" -- catppuccin-latte, catppuccin-frappe, catppuccin-macchiato, catppuccin-mocha
