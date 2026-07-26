local builtin = require('telescope.builtin')-- TELESCOPE
vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = 'Telescope find files' })-- TELESCOPE 
vim.keymap.set('n', '<leader>fg', builtin.live_grep,  { desc = 'Telescope live grep' })-- TELESCOPE 
vim.keymap.set('n', '<leader>fb', builtin.buffers,    { desc = 'Telescope buffers' })-- TELESCOPE 
vim.keymap.set('n', '<leader>fh', builtin.help_tags,  { desc = 'Telescope help tags' })-- TELESCOPE 

vim.keymap.set({'n'},           '<leader>n',  "<Cmd>NvimTreeFocus<CR>",     { desc = 'Focus on the tree' })-- NERDTREE
vim.keymap.set({'n', 'i', 'x'}, '<C-n>',      "<Cmd>NvimTreeFocus<CR>",     { desc = 'Show tree' })-- NERDTREE
vim.keymap.set({'n', 'i', 'x'}, '<C-M-n>',    "<Cmd>NvimTreeClose<CR>",     { desc = 'Close tree' }) --NERDTREE
vim.keymap.set({'n', 'x'},      '<C-x>',      "<Cmd>NvimTreeToggle<CR>",    { desc = 'Toggle the tree' })-- NERDTREE 
vim.keymap.set({'n', 'i', 'x'}, '<C-f>',      "<Cmd>NvimTreeFindFile<CR>",  { desc = 'Find on the tree' })-- NERDTREE
-- vim.keymap.set({'n', 'i', 'x'}, '<leader>c',  "<Cmd>NvimTreeClose<CR>",  { desc = 'Find on the tree' })

vim.keymap.set({'i'},            'jj',      "<ESC>",            { desc = 'Go to normal mode'})

vim.keymap.set({'n', 'x', 'o'}, 's', '<Plug>(leap)') -- for plugin leat - SPEED GOD 

-- vim.keymap.set({'n', 'i', 'x'}, '<leader>n',  "<Cmd>NvimTreeFocus<CR>",     { desc = 'Focus on the tree' })-- NERDTREE
-- vim.keymap.set({'n', 'i', 'x'}, '<C-n>',      "<Cmd>NvimTreeCollapse<CR>",  { desc = 'Show tree' })-- NERDTREE
-- vim.keymap.set({'n', 'i', 'x'}, '<C-t>',      "<Cmd>NvimTreeToggle<CR>",    { desc = 'Toggle the tree' })-- NERDTREE 
-- vim.keymap.set({'n', 'i', 'x'}, '<C-f>',      "<Cmd>NvimTreeFindFile<CR>",  { desc = 'Find on the tree' })-- NERDTREE
-- vim.keymap.set({'n', 'i', 'x'}, '<leader>c',  "<Cmd>NvimTreeClose<CR>",  { desc = 'Find on the tree' })

