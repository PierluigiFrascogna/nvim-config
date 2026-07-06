local gh = require('plugins.lib.remotes').gh

vim.pack.add {
  gh 'neovim/nvim-lspconfig',
  gh 'mason-org/mason.nvim',
  gh 'mason-org/mason-lspconfig.nvim',
}

require('mason').setup()

require('mason-lspconfig').setup {
  ensure_installed = {
    'lua_ls',
    'ruff',
    'ty',
    'angularls',
  },
  automatic_enable = true,
}
