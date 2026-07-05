local gh = require('plugins.lib.remotes').gh

vim.pack.add { gh 'stevearc/oil.nvim' }

require("oil").setup {
  view_options = {
    show_hidden = true,
  }
}

vim.keymap.set("n", "<leader>lf", function() require('oil').open(nil, { preview = { vertical = true } }) end,
  { desc = "[L]ist [F]iles" })
