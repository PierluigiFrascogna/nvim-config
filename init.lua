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
vim.o.splitright = true
vim.o.splitbelow = true

vim.keymap.set("n", "<leader>x", ":w<Enter>:source %<Enter>", { desc = 'source file' })

vim.keymap.set('n', '<left>', '<cmd>echo "Use h to move!!"<CR>')
vim.keymap.set('n', '<right>', '<cmd>echo "Use l to move!!"<CR>')
vim.keymap.set('n', '<up>', '<cmd>echo "Use k to move!!"<CR>')
vim.keymap.set('n', '<down>', '<cmd>echo "Use j to move!!"<CR>')

vim.keymap.set('n', '<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
vim.keymap.set('n', '<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
vim.keymap.set('n', '<C-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
vim.keymap.set('n', '<C-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })

vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>', { desc = "Clear search highlists" })

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
vim.keymap.set("n", "<leader>u", require("undotree").open, { desc = 'open undotree' })

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
require('mini.statusline').setup()

vim.pack.add {
  gh 'nvim-lua/plenary.nvim',
  gh 'nvim-telescope/telescope.nvim',
  gh 'nvim-telescope/telescope-ui-select.nvim',
  gh 'nvim-telescope/telescope-fzf-native.nvim'
}

require('telescope').setup {
  -- You can put your default mappings / updates / etc. in here
  --  All the info you're looking for is in `:help telescope.setup()`
  --
  -- defaults = {
  --   mappings = {
  --     i = { ['<c-enter>'] = 'to_fuzzy_refine' },
  --   },
  -- },
  -- pickers = {}
  extensions = {
    ['ui-select'] = { require('telescope.themes').get_dropdown() },
  },
}
pcall(require('telescope').load_extension, 'fzf')
pcall(require('telescope').load_extension, 'ui-select')
local tbuiltins = require "telescope.builtin"
vim.keymap.set("n", "<leader>sf", tbuiltins.find_files, { desc = "[S]earch [F]iles" })
vim.keymap.set("n", "<leader>sn", function() tbuiltins.fd({ cwd = vim.fn.stdpath('config') }) end,
  { desc = "[S]earch [N]eovim config" })
vim.keymap.set("n", "<leader>sh", tbuiltins.help_tags, { desc = "[S]earch [H]elp tags" })

-- Override default behavior and theme when searching
vim.keymap.set('n', '<leader>sc', function()
  -- You can pass additional configuration to Telescope to change the theme, layout, etc.
  tbuiltins.current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
    winblend = 10,
    previewer = false,
  })
end, { desc = '[S]earch in [C]urrent buffer' })

vim.pack.add { gh "nvim-treesitter/nvim-treesitter" }
require('nvim-treesitter').install { 'lua' }

vim.pack.add { gh "neovim/nvim-lspconfig" }
vim.lsp.enable('lua_ls')

vim.keymap.set('n', '<leader>f', function() vim.lsp.buf.format() end, { desc = '[F]ormat file' })

vim.keymap.set('n', '<leader>qd', function() vim.diagnostic.setqflist() end, { desc = '[Q]uicklist [D]iagnostics' })

vim.pack.add { gh 'stevearc/oil.nvim' }
require("oil").setup {
  view_options = {
    show_hidden = true,
  }
}
vim.keymap.set("n", "<leader>lf", function() require('oil').open(nil, { preview = { vertical = true } }) end,
  { desc = "[L]ist [F]iles" })

local function vimcmd(command) return function() vim.cmd(command) end end
vim.keymap.set('n', '<leader>ot', vimcmd ':terminal', { desc = '[O]pen [T]erminal' })

vim.pack.add({ { src = gh 'saghen/blink.cmp', version = vim.version.range('1.*'), }, })
require('blink.cmp').setup()

vim.keymap.set('t', '<Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })
vim.keymap.set('i', '<S-Backspace>', '<C-c>cb<del>', { desc = 'long backspace' })
vim.keymap.set('i', '<S-Enter>', '<C-X><C-O>', { desc = 'accept autocompletion' })
