vim.loader.enable()

vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

require 'options'

require 'keymaps'

require 'autocmds'

require 'plugins'


local gh = require('plugins.lib.sources').gh

vim.pack.add { gh 'folke/which-key.nvim' } -- Useful plugin to show you pending keybinds.
require('which-key').setup {
  -- Delay between pressing a key and opening which-key (milliseconds)
  delay = 2000,
  icons = { mappings = vim.g.have_nerd_font },
}

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
