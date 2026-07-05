local gh = require('plugins.lib.remotes').gh

vim.pack.add({ { src = gh 'nvim-mini/mini.statusline', version = 'stable' } })

require('mini.statusline').setup()
