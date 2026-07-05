local gh = require('plugins.lib.remotes').gh

vim.pack.add { gh "neovim/nvim-lspconfig" }

vim.lsp.enable('lua_ls')
