
vim.loader.enable()

vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

vim.opt.shiftwidth = 4
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

vim.keymap.set("n", "<leader>l", ":Ex<Enter>", {desc="open netrw"})
vim.keymap.set("n", "<leader>x", ":w<Enter>:source %<Enter>", {desc='source file'})

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

  vim.api.nvim_create_autocmd('PackChanged', {
    callback = function(ev)
      local name = ev.data.spec.name
      local kind = ev.data.kind
      if kind ~= 'install' and kind ~= 'update' then return end
      if name == 'nvim-treesitter' then
        if not ev.data.active then vim.cmd.packadd 'nvim-treesitter' end
        vim.cmd 'TSUpdate'
        return
      end
    end,
  })

vim.cmd('packadd nvim.undotree')
vim.keymap.set("n", "<leader>u", require("undotree").open, {desc='open undotree'})

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

vim.cmd.colorscheme "catppuccin-mocha" -- catppuccin-latte, catppuccin-frappe, catppuccin-macchiato, catppuccin-mocha

vim.pack.add { gh 'folke/todo-comments.nvim' }
require('todo-comments').setup { signs = false }

vim.pack.add({ { src = 'https://github.com/nvim-mini/mini.statusline', version = 'stable' } })

-- vim.pack.add {
--     gh 'nvim-lua/plenary.nvim',
--     gh 'nvim-telescope/telescope.nvim',
--     gh 'nvim-telescope/telescope-ui-select.nvim',
--     gh 'nvim-telescope/telescope-fzf-native.nvim'
-- }
--
--   require('telescope').setup {
--     -- You can put your default mappings / updates / etc. in here
--     --  All the info you're looking for is in `:help telescope.setup()`
--     --
--     -- defaults = {
--     --   mappings = {
--     --     i = { ['<c-enter>'] = 'to_fuzzy_refine' },
--     --   },
--     -- },
--     -- pickers = {}
--     --extensions = {
--       --['ui-select'] = { require('telescope.themes').get_dropdown() },
--     --},
--   }

vim.pack.add { gh "nvim-treesitter/nvim-treesitter" }
require('nvim-treesitter').install { 'lua' }

vim.pack.add { gh "neovim/nvim-lspconfig" }
vim.lsp.enable('lua_ls')
vim.lsp.config.lua_ls.settings.Lua = { diagnostics = { globals = { 'vim' } } }

