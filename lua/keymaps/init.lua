
vim.keymap.set("n", "<leader>x", ":w<Enter>:source %<Enter>", { desc = 'source file' })

vim.keymap.set('n', '<left>', '<cmd>echo "Use h to move!!"<CR>')
vim.keymap.set('n', '<right>', '<cmd>echo "Use l to move!!"<CR>')
vim.keymap.set('n', '<up>', '<cmd>echo "Use k to move!!"<CR>')
vim.keymap.set('n', '<down>', '<cmd>echo "Use j to move!!"<CR>')

vim.keymap.set('n', '<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
vim.keymap.set('n', '<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
vim.keymap.set('n', '<C-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
vim.keymap.set('n', '<C-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })

vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>', { desc = "Clear search highlists" })

vim.keymap.set('n', '<leader>f', function() vim.lsp.buf.format() end, { desc = '[F]ormat file' })

vim.keymap.set('n', '<leader>qd', function() vim.diagnostic.setqflist() end, { desc = '[Q]uicklist [D]iagnostics' })

local function vimcmd(command) return function() vim.cmd(command) end end
vim.keymap.set('n', '<leader>ot', vimcmd ':terminal', { desc = '[O]pen [T]erminal' })

vim.keymap.set('t', '<Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })

vim.keymap.set('i', '<S-Backspace>', '<C-c>cb<del>', { desc = 'long backspace' })

vim.keymap.set('i', '<S-Enter>', '<C-X><C-O>', { desc = 'accept autocompletion' })
