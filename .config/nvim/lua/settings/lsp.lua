-- LSP для C/C++ (Neovim 0.11+)

------------------------------------------------------------
-- clangd
------------------------------------------------------------
vim.lsp.config('clangd', {
  cmd = {
    'clangd',
    '--background-index',            -- индексировать проект в фоне
    '--clang-tidy',                  -- линтер clang-tidy
    '--header-insertion=iwyu',       -- автоподстановка #include
    '--completion-style=detailed',
    '--fallback-style=llvm',         -- если нет .clang-format
    '--query-driver=/usr/bin/*gcc*,/usr/bin/*g++*', -- для кросс-компиляторов
  },
  filetypes = { 'c', 'cpp', 'objc', 'objcpp', 'cuda' },
  root_markers = {
    '.clangd',
    '.clang-tidy',
    '.clang-format',
    'compile_commands.json',
    'compile_flags.txt',
    'configure.ac',
    '.git',
  },
})
vim.lsp.enable('clangd')

------------------------------------------------------------
-- Диагностика 
------------------------------------------------------------
vim.diagnostic.config({
  virtual_text = true,
  signs = true,
  underline = true,
  severity_sort = true,
  float = { border = 'rounded', source = true },
})

------------------------------------------------------------
-- Автодополнение: для встроенного vim.lsp.completion
------------------------------------------------------------
vim.opt.completeopt = { 'menu', 'menuone', 'noselect', 'popup' }

------------------------------------------------------------
-- Переключение .c/.cpp <-> .h (расширение clangd)
------------------------------------------------------------
local function switch_source_header(bufnr)
  local client = vim.lsp.get_clients({ bufnr = bufnr, name = 'clangd' })[1]
  if not client then return end
  local params = vim.lsp.util.make_text_document_params(bufnr)
  client:request('textDocument/switchSourceHeader', params, function(err, result)
    if err then
      return vim.notify(err.message, vim.log.levels.ERROR)
    end
    if not result then
      return vim.notify('Парный файл не найден', vim.log.levels.INFO)
    end
    vim.cmd.edit(vim.uri_to_fname(result))
  end, bufnr)
end

------------------------------------------------------------
-- Хоткеи и фичи при подключении LSP
------------------------------------------------------------
vim.api.nvim_create_autocmd('LspAttach', {
  group = vim.api.nvim_create_augroup('UserLspAttach', { clear = true }),
  callback = function(args)
    local buf = args.buf
    local client = vim.lsp.get_client_by_id(args.data.client_id)

    local function map(mode, lhs, rhs, desc)
      vim.keymap.set(mode, lhs, rhs, { buffer = buf, desc = desc })
    end

    -- Навигация
    map('n', 'gd', vim.lsp.buf.definition, 'LSP: definition')
    map('n', 'gD', vim.lsp.buf.declaration, 'LSP: declaration')
    map('n', 'gi', vim.lsp.buf.implementation, 'LSP: implementation')
    map('n', 'gr', vim.lsp.buf.references, 'LSP: references')
    map('n', 'gO', vim.lsp.buf.document_symbol, 'LSP: document symbols')
    map('n', '<leader>ws', vim.lsp.buf.workspace_symbol, 'LSP: workspace symbols')

    -- Информация
    map('n', 'K', vim.lsp.buf.hover, 'LSP: hover')
    map('i', '<C-s>', vim.lsp.buf.signature_help, 'LSP: signature help')

    -- Правки
    map('n', '<leader>r', vim.lsp.buf.rename, 'LSP: rename')
    map({ 'n', 'x' }, '<leader>ca', vim.lsp.buf.code_action, 'LSP: code action')
    map({ 'n', 'x' }, '<leader>f', function()
      vim.lsp.buf.format({ async = true })
    end, 'LSP: format')

    -- Диагностика
    map('n', '<leader>e', vim.diagnostic.open_float, 'Diagnostic: float')
    map('n', '[d', function() vim.diagnostic.jump({ count = -1, float = true }) end, 'Diagnostic: prev')
    map('n', ']d', function() vim.diagnostic.jump({ count = 1, float = true }) end, 'Diagnostic: next')
    map('n', '<leader>q', vim.diagnostic.setloclist, 'Diagnostic: loclist')

    -- Только для clangd
    if client and client.name == 'clangd' then
      map('n', '<leader>h', function() switch_source_header(buf) end, 'clangd: switch source/header')
    end

    -- Автодополнение через встроенный клиент
    if client and client:supports_method('textDocument/completion') then
      vim.lsp.completion.enable(true, client.id, buf, { autotrigger = true })
    end

    -- Inlay hints (типы параметров и т. п.)
    if client and client:supports_method('textDocument/inlayHint') then
      vim.lsp.inlay_hint.enable(true, { bufnr = buf })
    end
  end,
})
