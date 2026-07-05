local gh = require 'plugins.lib.remotes'.gh

vim.pack.add {
  gh 'folke/which-key.nvim',
}

require('which-key').setup {
  delay = 1000,
  icons = { mappings = true },
}
