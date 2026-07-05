local gh = require('plugins.lib.remotes').gh

vim.pack.add({ { src = gh 'saghen/blink.cmp', version = vim.version.range('1.*'), }, })

require('blink.cmp').setup()
