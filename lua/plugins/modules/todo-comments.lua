local gh = require('plugins.lib.remotes').gh

vim.pack.add { gh 'folke/todo-comments.nvim' }

require('todo-comments').setup { signs = false }
