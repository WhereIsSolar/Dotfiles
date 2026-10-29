vim.opt.number = true
vim.opt.relativenumber = true                 -- add line numbers

vim.opt.smarttab = true
vim.opt.tabstop = 4               -- number of columns occupied by a tab 
vim.opt.shiftwidth = 4            -- width for autoindents
vim.opt.softtabstop = 4           -- see multiple spaces as tabstops so <BS> does the right thing
vim.opt.expandtab = true              -- converts tabs to white space
vim.opt.autoindent = true             -- indent a new line the same amount as the line just typed
vim.opt.smartindent = true

vim.opt.cursorline = true              -- highlight current cursorline
vim.opt.mouse = 'a'                 -- enable mouse click

vim.opt.clipboard = 'unnamedplus'   -- using system clipboard
vim.opt.ignorecase = true            -- case insensitive
vim.opt.hlsearch   = true            -- highlight search 
vim.opt.incsearch  = true             -- incremental search
vim.opt.showmatch = true               -- show matching 
-- vim.opt.cc = '100'                  -- set an 80 column border for good coding style
vim.opt.ttyfast = true               -- Speed up scrolling in Vim 
vim.opt.syntax = 'on'              --syntax highlighting 
vim.opt.list = false
vim.opt.lcs = 'space:·'

vim.o.background = 'dark'
vim.opt.wildmenu = true 
vim.opt.wildmode = "longest:longest,full"
vim.opt.modeline = false

vim.cmd([[
    filetype plugin indent on 
    syntax enable

]])   -- get bash-like tab completions   --allow auto-indenting depending on file type


