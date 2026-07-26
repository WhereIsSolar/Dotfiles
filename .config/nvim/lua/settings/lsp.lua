-- Настройка LSP для C++
vim.api.nvim_create_autocmd('FileType', {
  pattern = 'cpp',
  callback = function()
    -- Автозапуск LSP при открытии файла
    vim.lsp.start({
      name = 'clangd',
      cmd = { 'clangd' },
      root_dir = vim.fs.dirname(vim.fs.find({ 'compile_commands.json', '.git' }, { upward = true })[1]),
    })
    
    -- Настройки LSP
    vim.keymap.set('n', 'gd', vim.lsp.buf.definition, { buffer = true })
    vim.keymap.set('n', 'K', vim.lsp.buf.hover, { buffer = true })
    vim.keymap.set('n', '<leader>r', vim.lsp.buf.rename, { buffer = true })
    vim.keymap.set('n', 'gr', vim.lsp.buf.references, { buffer = true })
    
    -- Автодополнение через <C-x><C-o>
    vim.bo.omnifunc = 'v:lua.vim.lsp.omnifunc'
  end
})

-- Базовая диагностика
vim.api.nvim_create_autocmd('LspAttach', {
  callback = function(args)
    vim.diagnostic.config({
      virtual_text = true,
      signs = true,
    })
    vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, { buffer = args.buf })
    vim.keymap.set('n', ']d', vim.diagnostic.goto_next, { buffer = args.buf })
  end
})
