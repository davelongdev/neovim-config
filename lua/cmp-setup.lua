-- [[ Configure nvim-cmp ]]
-- See `:help cmp`

-- create cmp variable that imports cmp
local cmp = require 'cmp'

-- create luasnip variable that imports luasnip
local luasnip = require 'luasnip'

-- for using vscode-style snippets and friendly-snippets
require('luasnip.loaders.from_vscode').lazy_load()

luasnip.config.setup {

--add custom snippets
  luasnip.add_snippets({
    "js", {
      luasnip.parser.parse_snippet(
        'cl',
        'console.log($0)'),
    },
    "lua", {
      luasnip.parser.parse_snippet(
        'lf',
        'local $1 = function($2)/n $0/nend'),
    },
    "html", {
      luasnip.parser.parse_snippet(
        '1',
        'html5'),
    },
  }),

  -- This tells LuaSnip to remember to keep around the last snippet.
  -- You can jump back into it even if you move outside of the selection
  history = true,

  -- This one is cool cause if you have dynamic snippets, it updates as you type!
  updateevents = "TextChanged,TextChangedI",

  -- Autosnippets:
  enable_autosnippets = true,
}

cmp.setup {
  enabled = function ()
    return vim.g.cmptoggle
  end,
  snippet = {
    expand = function(args)
      luasnip.lsp_expand(args.body)
    end,
  },
  completion = {
    completeopt = 'menu,menuone,noinsert',
  },
  mapping = cmp.mapping.preset.insert {
    ['<C-e>'] = cmp.mapping.abort(),
    ['<C-j>'] = cmp.mapping.select_next_item(),
    ['<C-k>'] = cmp.mapping.select_prev_item(),
    ['<C-d>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<C-Space>'] = cmp.mapping.complete {}, -- purpose?
    ['<CR>'] = cmp.mapping.confirm {
      behavior = cmp.ConfirmBehavior.Replace,
      select = true,
    },
    ['<Tab>'] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_next_item()
      elseif luasnip.expand_or_locally_jumpable() then
        luasnip.expand_or_jump()
      else
        fallback()
      end
    end, { 'i', 's' }),
    ['<S-Tab>'] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_prev_item()
      elseif luasnip.locally_jumpable(-1) then
        luasnip.jump(-1)
      else
        fallback()
      end
    end, { 'i', 's' }),
  },
  sources = {
    { name = 'nvim_lsp' },
    { name = 'luasnip' },
    { name = 'path' },
  },
}

-- vim: ts=2 sts=2 sw=2 et
