local gh = require('plugins.lib.remotes').gh

vim.pack.add { gh "nvim-treesitter/nvim-treesitter" }

require('nvim-treesitter').install { 'lua' }
