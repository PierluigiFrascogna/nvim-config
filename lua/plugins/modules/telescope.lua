local gh = require('plugins.lib.remotes').gh

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
