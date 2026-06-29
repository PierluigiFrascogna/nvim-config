local plugins_dir = vim.fs.joinpath(vim.fn.stdpath 'config', 'lua', 'plugins', 'modules')

require('lib.require-all')(plugins_dir)
