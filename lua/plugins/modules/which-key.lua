local gh = require 'plugins.lib.remotes'.gh

vim.pack.add { 
  gh 'folke/which-key.nvim',
}

require('which-key').setup {
  delay = 2000,
  icons = { mappings = vim.g.have_nerd_font },
}
