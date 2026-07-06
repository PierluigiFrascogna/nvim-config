local gh = require('plugins.lib.remotes').gh

vim.pack.add {
  gh "WhoIsSethDaniel/mason-tool-installer.nvim",
}

require("mason-tool-installer").setup {
  ensure_installed = {
    "stylua",
  }, -- Quando levi roba da questa lista NON usare MasonToolsClean perché disinstalla anche gli lsp che installi dall'altra parte
}
