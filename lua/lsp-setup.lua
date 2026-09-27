-- [[ Configure LSP ]]
--  This function gets run when an LSP connects to a particular buffer.
local on_attach = function(_, bufnr)
  -- NOTE: Remember that lua is a real programming language, and as such it is possible
  -- to define small helper and utility functions so you don't have to repeat yourself
  -- many times.
  --
  -- In this case, we create a function that lets us more easily define mappings specific
  -- for LSP related items. It sets the mode, buffer and description for us each time.
  local nmap = function(keys, func, desc)
    if desc then
      desc = 'LSP: ' .. desc
    end

    vim.keymap.set('n', keys, func, { buffer = bufnr, desc = desc })
  end

  nmap('<leader>rn', vim.lsp.buf.rename, 're[n]ame')
  nmap('<leader>ca', vim.lsp.buf.code_action, 'code [a]ction')

  nmap('gd', require('telescope.builtin').lsp_definitions, '[g]oto [d]efinition')
  nmap('gr', require('telescope.builtin').lsp_references, '[g]oto [r]eferences')
  nmap('gI', require('telescope.builtin').lsp_implementations, '[g]oto [I]mplementation')
  nmap('<leader>D', require('telescope.builtin').lsp_type_definitions, 'type [D]efinition')
  nmap('<leader>ds', require('telescope.builtin').lsp_document_symbols, 'document [s]ymbols')
  nmap('<leader>ws', require('telescope.builtin').lsp_dynamic_workspace_symbols, 'workspace [s]ymbols')

  -- See `:help K` for why this keymap
  nmap('K', vim.lsp.buf.hover, 'Hover Documentation')
  nmap('<C-k>', vim.lsp.buf.signature_help, 'Signature Documentation')

  -- Lesser used LSP functionality
  nmap('gD', vim.lsp.buf.declaration, '[g]oto [D]eclaration')
  nmap('<leader>wa', vim.lsp.buf.add_workspace_folder, 'workspace [a]dd folder')
  nmap('<leader>wr', vim.lsp.buf.remove_workspace_folder, 'workspace [r]emove folder')
  nmap('<leader>wl', function()
    print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
  end, 'workspace [l]ist folders')

  -- Create a command `:Format` local to the LSP buffer
  vim.api.nvim_buf_create_user_command(bufnr, 'Format', function(_)
    vim.lsp.buf.format()
  end, { desc = 'Format current buffer with LSP' })
end

-- mason-lspconfig requires that these setup functions are called in this order
-- before setting up the servers.
require('mason').setup()
require('mason-lspconfig').setup()

-- Enable the following language servers
--  Feel free to add/remove any LSPs that you want here. They will automatically be installed.
--
--  Add any additional override configuration in the following tables. They will be passed to
--  the `settings` field of the server config. You must look up that documentation yourself.
--
--  If you want to override the default filetypes that your language server will attach to you can
--  define the property 'filetypes' to the map in question.
local servers = {
  clangd = {},
  -- gopls = {},
  -- pyright = {},
  -- rust_analyzer = {},
  -- tsserver = {},
  -- html = { filetypes = { 'html', 'twig', 'hbs'} },

  lua_ls = {
    Lua = {
      workspace = { checkThirdParty = false },
      telemetry = { enable = false },
      -- NOTE: toggle below to ignore Lua_LS's noisy `missing-fields` warnings
      -- diagnostics = { disable = { 'missing-fields' } },
    },
  },
}

-- Setup neovim lua configuration
require('neodev').setup()

-- nvim-cmp supports additional completion capabilities, so broadcast that to servers
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)

-- Ensure the servers above are installed
local mason_lspconfig = require 'mason-lspconfig'

mason_lspconfig.setup {
  ensure_installed = vim.tbl_keys(servers),
}

require("mason").setup()
-- Note: `nvim-lspconfig` needs to be in 'runtimepath' by the time you set up mason-lspconfig.nvim
require("mason-lspconfig").setup {
  ensure_installed = { "lua_ls" }
}

-- clangd: trust the ARM cross-compiler so embedded projects get
-- correct system include paths
vim.lsp.config('clangd', {
  cmd = { 'clangd', '--query-driver=/usr/bin/arm-none-eabi-gcc' },
})
-- clangd marks code inside a false #if (e.g. another hub's HMI file in a
-- Build HAT compile database) as 'comment' semantic tokens, so whole files
-- go grey. Toggle that override off/on; treesitter highlights underneath.
local inactive_hl = vim.api.nvim_get_hl(0, { name = '@lsp.type.comment', link = true })
local inactive_shown = true
local function toggle_inactive()
  inactive_shown = not inactive_shown
  vim.api.nvim_set_hl(0, '@lsp.type.comment', inactive_shown and inactive_hl or {})
  vim.notify('inactive-code greying ' .. (inactive_shown and 'on' or 'off'))
end
vim.api.nvim_create_user_command('ToggleInactive', toggle_inactive, {})
vim.keymap.set('n', '<leader>ti', toggle_inactive, { desc = '[t]oggle [i]nactive-code greying' })

-- vim: ts=2 sts=2 sw=2 et
