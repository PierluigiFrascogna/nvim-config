vim.cmd('packadd nvim.undotree')
vim.keymap.set("n", "<leader>ou", require("undotree").open, { desc = '[O]pen [U]ndotree' })
