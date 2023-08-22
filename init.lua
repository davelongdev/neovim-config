
-- [[Kickstart Config]]
-----------------------------------

--------------------
  -- mystuff
--------------------

--vimwiki

vim.g.vimwiki_list = {
  {
    path = '~/vimwiki/',
    syntax = 'markdown',
    ext = '.md'
  },
}

-- disable netrw at the very start of your init.lua (strongly advised)
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- set termguicolors to enable highlight groups
vim.opt.termguicolors = true

-----------------------------------
-- [[General Stuff]]
-----------------------------------

-- Set <space> as the leader key
--  NOTE: Must happen before plugins are required (otherwise wrong leader will be used)
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- Install package manager
--    `:help lazy.nvim.txt` for more info
local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system {
    'git',
    'clone',
    '--filter=blob:none',
    'https://github.com/folke/lazy.nvim.git',
    '--branch=stable', -- latest stable release
    lazypath,
  }
end
vim.opt.rtp:prepend(lazypath)

--------------------------
--Plugins
--------------------------

--  You can configure plugins using the `config` key.
--
--  You can also configure plugins after the setup call,
--    as they will be available in your neovim runtime.

-- Lazy Plugin Manager - All plugins get required here
require('lazy').setup({

---------------
-- mystuff
  'HiPhish/rainbow-delimiters.nvim',
  'catppuccin/nvim',
  'michal-h21/vim-zettel',
  'junegunn/goyo.vim',
  'preservim/tagbar',
  'vimwiki/vimwiki',
  'ThePrimeagen/harpoon',
  'nvim-treesitter/playground',
  'christoomey/vim-tmux-navigator',
  'tpope/vim-surround',
  'windwp/nvim-autopairs',
  'kdheepak/lazygit.nvim',
  'thezeroalpha/vim-relatively-complete',
  'nvim-tree/nvim-tree.lua',
  'moll/vim-bbye',
  'sainnhe/gruvbox-material',
  'ap/vim-css-color',
  {
    'akinsho/bufferline.nvim',
    version = "*",
    dependencies = 'nvim-tree/nvim-web-devicons'
},

-- lf integration
{
    'ptzz/lf.vim',
    dependencies = {
      'voldikss/vim-floaterm'
    }
},

-- dadbod / database stuff
{
  'tpope/vim-dadbod',
  opt = true,
  dependencies = {
    'kristijanhusak/vim-dadbod-ui',
    'kristijanhusak/vim-dadbod-completion',
  },
  config = function()
    require('config.dadbod').setup()
  end,
  cmd = { 'DBUIToggle', 'DBUI', 'DBUIAddConnection', 'DBUIFindBuffer', 'DBUIRenameBuffer', 'DBUILastQueryInfo' },
},

--------------------
------ end mystuff

  -- NOTE: First, some plugins that don't require any configuration

  -- Git related plugins
  'tpope/vim-fugitive',
  'tpope/vim-rhubarb',

  -- Detect tabstop and shiftwidth automatically
  'tpope/vim-sleuth',

  -- LSP PLUGINS: This is where your plugins related to LSP can be installed.
  --  The configuration is done below. Search for lspconfig to find it below.
  { -- LSP Configuration & Plugins
    'neovim/nvim-lspconfig',
    dependencies = {
      -- Automatically install LSPs to stdpath for neovim
      'williamboman/mason.nvim',
      'williamboman/mason-lspconfig.nvim',

      -- Useful status updates for LSP
      -- NOTE: `opts = {}` is the same as calling `require('fidget').setup({})`
      { 'j-hui/fidget.nvim',
        opts = {},
        tag = "legacy",
      },
     --
      -- Additional lua configuration, makes nvim stuff amazing!
      'folke/neodev.nvim',
    },
  },

  { -- Autocompletion
    'hrsh7th/nvim-cmp',
    dependencies = {
      'hrsh7th/cmp-nvim-lsp',
      'L3MON4D3/LuaSnip',
      'saadparwaiz1/cmp_luasnip' },
  },

  -- Whichkey 
  {
    'folke/which-key.nvim',
    opts = {}
  },

  { -- Adds git releated signs to the gutter, as well as utilities for managing changes
    'lewis6991/gitsigns.nvim',
    opts = {
      -- See `:help gitsigns.txt`
      signs = {
        add = { text = '+' },
        change = { text = '~' },
        delete = { text = '_' },
        topdelete = { text = '‾' },
        changedelete = { text = '~' },
      },
    },
  },

  { -- Theme inspired by Atom
    'catppuccin/nvim',
    priority = 1000,
    config = function()
      vim.cmd.colorscheme 'catppuccin-macchiato'
    end,
  },

  { -- Set lualine as statusline
    'nvim-lualine/lualine.nvim',
    -- See `:help lualine.txt`
    opts = {
      options = {
        icons_enabled = false,
        component_separators = '|',
        section_separators = '',
      },
    },
  },

  { -- Add indentation guides even on blank lines
    'lukas-reineke/indent-blankline.nvim',
    -- Enable `lukas-reineke/indent-blankline.nvim`
    -- See `:help indent_blankline.txt`
    opts = {
      char = '┊',
      show_trailing_blankline_indent = false,
    }
  },

  -- "gc" to comment visual regions/lines
  { 'numToStr/Comment.nvim', opts = {} },

  -- Fuzzy Finder (files, lsp, etc)
  { 'nvim-telescope/telescope.nvim', version = '*', dependencies = { 'nvim-lua/plenary.nvim' } },

  -- Fuzzy Finder Algorithm that requires local dependencies to be built.
  -- Only load if `make` is available. Make sure you have the system
  -- requirements installed.
  {
    'nvim-telescope/telescope-fzf-native.nvim',
    -- NOTE: If you are having trouble with this installation,
    --       refer to the README for telescope-fzf-native for more instructions.
    build = 'make',
    cond = function()
      return vim.fn.executable 'make' == 1
    end,
  },

  { -- Highlight, edit, and navigate code
    'nvim-treesitter/nvim-treesitter',
    dependencies = {
      'nvim-treesitter/nvim-treesitter-textobjects',
    },
    config = function()
      pcall(require('nvim-treesitter.install').update { with_sync = true })
    end,
  },

  -- NOTE: Next Step on Your Neovim Journey: Add/Configure additional "plugins" for kickstart
  --       These are some example plugins that I've included in the kickstart repository.
  --       Uncomment any of the lines below to enable them.
  -- require 'kickstart.plugins.autoformat',
  -- require 'kickstart.plugins.debug',

  -- NOTE: The import below automatically adds your own plugins, configuration, etc from `lua/custom/plugins/*.lua`
  --    You can use this folder to prevent any conflicts with this init.lua if you're interested in keeping
  --    up-to-date with whatever is in the kickstart repo.
  --
  --    For additional information see: https://github.com/folke/lazy.nvim#-structuring-your-plugins
  --
  --    An additional note is that if you only copied in the `init.lua`, you can just comment this line
  --    to get rid of the warning telling you that there are not plugins in `lua/custom/plugins/`.
  -- { import = 'custom.plugins' },
}, {})

-----------------------------
-- [[ Setting options ]]
-----------------------------
local o = vim.o
-- See `:help vim.o`

-- disable swap files for use w/ tmux

o.swapfile=false

-- clean up start screen
o.shortmess = vim.o.shortmess .. 'I'
--
-- Set highlight on search
o.hlsearch = true

-- Make line numbers default
vim.wo.number = true

-- line numbers
o.relativenumber = true -- show relative line numbers
o.number = true -- shows absolute line number on cursor line (when relative number is on)

-- tabs & indentation
o.tabstop = 2 -- 2 spaces for tabs (prettier default)
o.shiftwidth = 2 -- 2 spaces for indent width
o.expandtab = true -- expand tab to spaces
o.autoindent = true -- copy indent from current line when starting new one

-- line wrapping
o.wrap = true

-- search settings
o.ignorecase = true -- ignore case when searching
o.smartcase = true -- if you include mixed case in your search, assumes you want case-sensitive

-- cursor line
o.cursorline = true -- highlight the current cursor line

-- appearance

-- turn on termguicolors for nightfly colorscheme to work
-- (have to use iterm2 or any other true color terminal)
o.termguicolors = true
o.background = "dark" -- colorschemes that can be light or dark will be made dark
o.signcolumn = "yes" -- show sign column so that text doesn't shift

-- backspace
o.backspace = "indent,eol,start" -- allow backspace on indent, end of line or insert mode start position

-------------fix
-- clipboard
-- vim.o.clipboard:append("unnamedplus") -- use system clipboard as default register

-- split windows
o.splitright = true -- split vertical window to the right
o.splitbelow = true -- split horizontal window to the bottom


-------------fix
-- vim.o.iskeyword:append("-") -- consider string-string as whole word

-- Enable mouse mode
o.mouse = 'a'

-- Sync clipboard between OS and Neovim.
--  Remove this option if you want your OS clipboard to remain independent.
--  See `:help 'clipboard'`
o.clipboard = 'unnamedplus'

-- Enable break indent
o.breakindent = true

-- Save undo history
o.undofile = true

-- Case insensitive searching UNLESS /C or capital in search
o.ignorecase = true
o.smartcase = true

-- Keep signcolumn on by default
vim.wo.signcolumn = 'yes'

-- Decrease update time
o.updatetime = 250
o.timeout = true
o.timeoutlen = 300

-- Set completeopt to have a better completion experience
o.completeopt = 'menuone,noselect'

-- NOTE: You should make sure your terminal supports this
o.termguicolors = true

-------------------------------
-- [[ Keymaps ]]
-------------------------------

local keymap = vim.keymap -- for conciseness

-- Keymaps for better default experience
-- See `:help vim.keymap.set()`
keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })

-- Remap for dealing with word wrap
keymap.set('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
keymap.set('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

-- [[ Highlight on yank ]]
-- See `:help vim.highlight.on_yank()`
local highlight_group = vim.api.nvim_create_augroup('YankHighlight', { clear = true })
vim.api.nvim_create_autocmd('TextYankPost', {
  callback = function()
    vim.highlight.on_yank()
  end,
  group = highlight_group,
  pattern = '*',
})

-------------------
-- My Keymaps
-------------------

-- help links
keymap.set("n", "<M-l>", "<C-]>")
keymap.set("n", "<M-o>", "<C-o>")

--command mode movement
keymap.set("c", "<C-h>", "<Left>")
keymap.set("c", "<C-l>", "<Right>")
keymap.set("c", "<C-j>", "<Down>")
keymap.set("c", "<C-k>", "<Up>")
keymap.set("c", "<C-a>", "<Home>")
keymap.set("c", "<C-e>", "<End>")
keymap.set("c", "<C-b>", "<S-Left>")
keymap.set("c", "<C-w>", "<S-Right>")
-- keymap.set("c", "Left", "<C-h>")

--cyling within command mode completion menu
vim.cmd('cnoremap <c-k> <c-p>')
vim.cmd('cnoremap <c-j> <c-n>')

keymap.set("n", "dd", '"_dd')

-- Vertical Movement - half page & stays in center
keymap.set("n", "<C-d>", "<C-d>zz")
keymap.set("n", "<C-u>", "<C-u>zz")

-- use jk to exit insert mode
keymap.set("i", "jk", "<ESC>")

-- clear search highlights
keymap.set("n", "<leader>nh", ":nohl<CR>")

-- delete single character without copying into register
keymap.set("n", "x", '"_x')

-- increment/decrement numbers
keymap.set("n", "<leader>+", "<C-a>") -- increment
keymap.set("n", "<leader>-", "<C-x>") -- decrement

-- window management

keymap.set("n", "<leader>sv", "<C-w>v") -- split window vertically
keymap.set("n", "<leader>sh", "<C-w>s") -- split window horizontally
keymap.set("n", "<leader>se", "<C-w>=") -- make split windows equal width & height
keymap.set("n", "<leader>sx", ":close<CR>") -- close current split window

keymap.set("n", "<leader>to", ":tabnew<CR>") -- open new tab
keymap.set("n", "<leader>tx", ":tabclose<CR>") -- close current tab
keymap.set("n", "<leader>tn", ":tabn<CR>") --  go to next tab
keymap.set("n", "<leader>tp", ":tabp<CR>") --  go to previous tab

-- resize windows
keymap.set("n", "<M-Up>", ":resize -2<CR>")
keymap.set("n", "<M-Down>", ":resize +2<CR>")
keymap.set("n", "<M-Left>", ":vertical resize -2<CR>")
keymap.set("n", "<M-Right>", ":vertical resize +2<CR>")

-- Navigate buffers
keymap.set("n", "<leader>l", ":bnext<CR>")
keymap.set("n", "<leader>h", ":bprevious<CR>")

-- Move text up and down
keymap.set("n", "<M-j>", "<Esc>:m .+1<CR>==")
keymap.set("n", "<M-k>", "<Esc>:m .-2<CR>==")

-- Move text up and down

---------------------
-- Visual Mode
---------------------

-- Move selected text left & right (Stay in indent mode)
keymap.set("v", "<", "<gv")
keymap.set("v", ">", ">gv")

-- Move single line up and down? 
keymap.set("v", "<M-j>", ":m .+1<CR>==")
keymap.set("v", "<M-k>", ":m .-2<CR>==")
keymap.set("v", "p", '"_dP')

-- Move text up and down?
keymap.set("x", "<M-j>", ":move '>+1<CR>gv-gv")
keymap.set("x", "<M-k>", ":move '<-2<CR>gv-gv")

----------------------
-- Plugins
----------------------

-- plugin configs here 

-- nvim-tree
keymap.set("n", "<leader>e", ":NvimTreeToggle<CR>") -- toggle file explorer

----------------------
--Configurations
----------------------

--harpoon

local mark = require("harpoon.mark")
local ui = require("harpoon.ui")

keymap.set("n", "<leader>a", mark.add_file)
keymap.set("n", "<C-e>", ui.toggle_quick_menu)

keymap.set("n", "<leader>1", function() ui.nav_file(1) end)
keymap.set("n", "<leader>2", function() ui.nav_file(2) end)
keymap.set("n", "<leader>3", function() ui.nav_file(3) end)
keymap.set("n", "<leader>4", function() ui.nav_file(4) end)
keymap.set("n", "<leader>5", function() ui.nav_file(4) end)
keymap.set("n", "<leader>6", function() ui.nav_file(4) end)


-- tmux-navigation setup

-- require'vim-tmux-navigation'.setup {
--     disable_when_zoomed = true, -- defaults to false
--     keybindings = {
--         left = "<C-h>",
--         down = "<C-j>",
--         up = "<C-k>",
--         right = "<C-l>",
--         last_active = "<C-\\>",
--         next = "<C-x>",
--     }
-- }

-- RAINBOW DELIMITERS SETUP

-- This module contains a number of default definitions

local rainbow_delimiters = require 'rainbow-delimiters'

vim.g.rainbow_delimiters = {
    strategy = {
        [''] = rainbow_delimiters.strategy['global'],
        vim = rainbow_delimiters.strategy['local'],
    },
    query = {
        [''] = 'rainbow-delimiters',
        lua = 'rainbow-blocks',
        javascript = 'rainbow-delimiters-react',
        astro = '; inherits: ecma, jsx, html, typescript',
    },
    highlight = {
    'RainbowDelimiterRed',
    'RainbowDelimiterViolet',
    'RainbowDelimiterOrange',
    'RainbowDelimiterYellow',
    'RainbowDelimiterBlue',
    'RainbowDelimiterGreen',
    'RainbowDelimiterCyan',
    },
}


-- TREESITTER SETUP

require "nvim-treesitter.configs".setup
  ---@diagnostic disable-next-line missing-fields      
  {
  highlight = {
    enable = true
  },
  indent = {
    enable = true,
    disable = {}
  },
  playground = {
    enable = true,
    disable = {},
    updatetime = 25, -- Debounced time for highlighting nodes in the playground from source code
    persist_queries = false, -- Whether the query persists across vim sessions
    keybindings = {
      toggle_query_editor = 'o',
      toggle_hl_groups = 'i',
      toggle_injected_languages = 't',
      toggle_anonymous_nodes = 'a',
      toggle_language_display = 'I',
      focus_language = 'f',
      unfocus_language = 'F',
      update = 'R',
      goto_node = '<cr>',
      show_help = '?',
    },
  }
}

-- WHICHKEY SETUP

local wk = require("which-key")
wk.register({
  i = {
    "[i]nfo :WhichKey main",
    { ":WhichKey<Cr>", "open whichkey" },
  },
  a = "add harpoon mark",
  s = {
    name = "search"
  },
  g = {
    "lazygit",
    { ":LazyGit<Cr>", "open lazygit"},
  },
  b = {
    name = "bufferline",
    h = { ":BufferLineMovePrev<Cr>", "move prev" },
    l = { ":BufferLineMoveNext<Cr>", "move next" },
  },
  m = { ":Bdelete<Cr>", "delete current buffer" },
  dd = {
      name = "Database",
      u = { ":DBUIToggle<Cr>", "Toggle UI" },
      f = { "<Cmd>DBUIFindBuffer<Cr>", "Find buffer" },
      r = { "<Cmd>DBUIRenameBuffer<Cr>", "Rename buffer" },
      q = { "<Cmd>DBUILastQueryInfo<Cr>", "Last query info" },
  },
}, { prefix = "<leader>" })

--NVIMTREE SETUP

-- empty setup using defaults
require("nvim-tree").setup()

-- BUFFERLINE SETUP

require("bufferline").setup
  ---@diagnostic disable-next-line missing-fields      
  {
  options =
    ---@diagnostic disable-next-line missing-fields      
    {
    mode = "buffers", -- set to "tabs" to only show tabpages instead
    --style_preset = bufferline.presets.default, -- or bufferline.presets.minimal,
    themable = true, --| false, -- allows highlight groups to be overriden i.e. sets highlights as default
    numbers = "buffer_id", --"none", "ordinal" | "buffer_id" | "both" | function({ ordinal, id, lower, raise }): string,
    close_command = "bdelete! %d",       -- can be a string | function, | false see "Mouse actions"
    right_mouse_command = "bdelete! %d", -- can be a string | function | false, see "Mouse actions"
    left_mouse_command = "buffer %d",    -- can be a string | function, | false see "Mouse actions"
    middle_mouse_command = nil,          -- can be a string | function, | false see "Mouse actions"
    indicator = {
        icon = '▎', -- this should be omitted if indicator style is not 'icon'
        style = 'icon' --| 'underline' | 'none',
    },
    buffer_close_icon = '',
    modified_icon = '●',
    close_icon = '',
    left_trunc_marker = '',
    right_trunc_marker = '',
    --- name_formatter can be used to change the buffer's label in the bufferline.
    --- Please note some names can/will break the
    --- bufferline so use this at your discretion knowing that it has
    --- some limitations that will *NOT* be fixed.
    --name_formatter = function(buf)  -- buf contains:
          -- name                | str        | the basename of the active file
          -- path                | str        | the full path of the active file
          -- bufnr (buffer only) | int        | the number of the active buffer
          -- buffers (tabs only) | table(int) | the numbers of the buffers in the tab
          -- tabnr (tabs only)   | int        | the "handle" of the tab, can be converted to its ordinal number using: `vim.api.nvim_tabpage_get_number(buf.tabnr)`
    --end,
    max_name_length = 18,
    max_prefix_length = 15, -- prefix used when a buffer is de-duplicated
    truncate_names = true, -- whether or not tab names should be truncated
    tab_size = 18,
    diagnostics = false, --| "nvim_lsp" | "coc",
    diagnostics_update_in_insert = false,
    -- The diagnostics indicator can be set to nil to keep the buffer name highlight but delete the highlighting
    --diagnostics_indicator = function(count, level, diagnostics_dict, context)
        --return "("..count..")"
    --end,
    -- NOTE: this will be called a lot so don't do any heavy processing here
    -- custom_filter = function(buf_number, buf_numbers)
    --     -- filter out filetypes you don't want to see
    --     if vim.bo[buf_number].filetype ~= "<i-dont-want-to-see-this>" then
    --         return true
    --     end
    --     -- filter out by buffer name
    --     if vim.fn.bufname(buf_number) ~= "<buffer-name-I-dont-want>" then
    --         return true
    --     end
    --     -- filter out based on arbitrary rules
    --     -- e.g. filter out vim wiki buffer from tabline in your work repo
    --     if vim.fn.getcwd() == "<work-repo>" and vim.bo[buf_number].filetype ~= "wiki" then
    --         return true
    --     end
    --     -- filter out by it's index number in list (don't show first buffer)
    --     if buf_numbers[1] ~= buf_number then
    --         return true
    --     end
    -- end,
    offsets = {
        {
            filetype = "NvimTree",
            text = "File Explorer", --| function ,
            text_align = "left", --| "center" | "right"
            separator = false
        }
    },
    color_icons = true, --| false, -- whether or not to add the filetype icon highlights
    -- get_element_icon = function(element)
    --   -- element consists of {filetype: string, path: string, extension: string, directory: string}
    --   -- This can be used to change how bufferline fetches the icon
    --   -- for an element e.g. a buffer or a tab.
    --   -- e.g.
    --   local icon, hl = require('nvim-web-devicons').get_icon_by_filetype(element.filetype, { default = false })
    --   return icon, hl
    --   -- or
    --   local custom_map = {my_thing_ft: {icon = "my_thing_icon", hl}}
    --   return custom_map[element.filetype]
    -- end,
    show_buffer_icons = true, --| false, -- disable filetype icons for buffers
    show_buffer_close_icons = true, -- | false,
    show_close_icon = true, --| false,
    show_tab_indicators = true, --| false,
    show_duplicate_prefix = true, --| false, -- whether to show duplicate buffer prefix
    persist_buffer_sort = true, -- whether or not custom sorted buffers should persist
    -- can also be a table containing 2 custom separators
    -- [focused and unfocused]. eg: { '|', '|' }
    separator_style = "thin", --"slant", | "slope" | "thick" | "thin" | { 'any', 'any' },
    enforce_regular_tabs = false, --| true,
    always_show_bufferline = true, --| false,
    hover = {
        enabled = true,
        delay = 200,
        reveal = {'close'}
    },
    sort_by = 'insert_after_current', --|'insert_at_end' | 'id' | 'extension' | 'relative_directory' | 'directory' | 'tabs' | function(buffer_a, buffer_b)
        -- add custom logic
        --return buffer_a.modified > buffer_b.modified
    --end

  },
}

-- import nvim-autopairs safely

local autopairs_setup, autopairs = pcall(require, "nvim-autopairs")
if not autopairs_setup then
	return
end

-- configure autopairs
autopairs.setup({
	check_ts = true, -- enable treesitter
	ts_config = {
		lua = { "string" }, -- don't add pairs in lua string treesitter nodes
		javascript = { "template_string" }, -- don't add pairs in javscript template_string treesitter nodes
		java = false, -- don't check treesitter on java
	},
})

-- import nvim-autopairs completion functionality safely
local cmp_autopairs_setup, cmp_autopairs = pcall(require, "nvim-autopairs.completion.cmp")
if not cmp_autopairs_setup then
	return
end

-- import nvim-cmp plugin safely (completions plugin)
local cmp_setup, cmp = pcall(require, "cmp")
if not cmp_setup then
	return
end

-- make autopairs and completion work together
cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())

-- [[ Configure Telescope ]]
-- See `:help telescope` and `:help telescope.setup()`
local actions = require "telescope.actions"
require('telescope').setup {
  defaults = {
    mappings = {
      i = {
        ['<C-u>'] = false,
        ['<C-d>'] = false,
        ["<C-j>"] = actions.move_selection_next,
        ["<C-k>"] = actions.move_selection_previous,
      },
    },
  },
}

-- Enable telescope fzf native, if installed
pcall(require('telescope').load_extension, 'fzf')

-- See `:help telescope.builtin`
vim.keymap.set('n', '<leader>?', require('telescope.builtin').oldfiles, { desc = '[?] Find recently opened files' })
vim.keymap.set('n', '<leader><space>', require('telescope.builtin').buffers, { desc = '[ ] Find existing buffers' })
vim.keymap.set('n', '<leader>/', function()
  -- You can pass additional configuration to telescope to change theme, layout, etc.
  require('telescope.builtin').current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
    winblend = 10,
    previewer = false,
  })
end, { desc = '[/] Fuzzily search in current buffer' })

vim.keymap.set('n', '<leader>sf', require('telescope.builtin').find_files, { desc = '[S]earch [F]iles' })
vim.keymap.set('n', '<leader>sh', require('telescope.builtin').help_tags, { desc = '[S]earch [H]elp' })
vim.keymap.set('n', '<leader>sw', require('telescope.builtin').grep_string, { desc = '[S]earch current [W]ord' })
vim.keymap.set('n', '<leader>sg', require('telescope.builtin').live_grep, { desc = '[S]earch by [G]rep' })
vim.keymap.set('n', '<leader>sd', require('telescope.builtin').diagnostics, { desc = '[S]earch [D]iagnostics' })
vim.keymap.set('n', '<leader>sk', require('telescope.builtin').keymaps, { desc = '[S]earch [K]eymaps' })

-- [[ Configure Treesitter ]]
-- See `:help nvim-treesitter`
require('nvim-treesitter.configs').setup
  ---@diagnostic disable-next-line missing-fields      
  {
  -- Add languages to be installed here that you want installed for treesitter
  ensure_installed = { 'c', 'cpp', 'go', 'lua', 'python', 'rust', 'tsx', 'typescript', 'vimdoc', 'vim' },

  -- Autoinstall languages that are not installed. Defaults to false (but you can change for yourself!)
  auto_install = false,

  highlight = { enable = true },
  indent = { enable = true, disable = { 'python' } },
  incremental_selection = {
    enable = true,
    keymaps = {
      init_selection = '<c-space>',
      node_incremental = '<c-space>',
      scope_incremental = '<c-s>',
      node_decremental = '<M-space>',
    },
  },
  textobjects = {
    select = {
      enable = true,
      lookahead = true, -- Automatically jump forward to textobj, similar to targets.vim
      keymaps = {
        -- You can use the capture groups defined in textobjects.scm
        ['aa'] = '@parameter.outer',
        ['ia'] = '@parameter.inner',
        ['af'] = '@function.outer',
        ['if'] = '@function.inner',
        ['ac'] = '@class.outer',
        ['ic'] = '@class.inner',
      },
    },
    move = {
      enable = true,
      set_jumps = true, -- whether to set jumps in the jumplist
      goto_next_start = {
        [']m'] = '@function.outer',
        [']]'] = '@class.outer',
      },
      goto_next_end = {
        [']M'] = '@function.outer',
        [']['] = '@class.outer',
      },
      goto_previous_start = {
        ['[m'] = '@function.outer',
        ['[['] = '@class.outer',
      },
      goto_previous_end = {
        ['[M'] = '@function.outer',
        ['[]'] = '@class.outer',
      },
    },
    swap = {
      enable = true,
      swap_next = {
        ['<leader>p'] = '@parameter.inner',
      },
      swap_previous = {
        ['<leader>P'] = '@parameter.inner',
      },
    },
  },
}

-- Diagnoscics Options
vim.diagnostic.config({
  virtual_text = false,
  signs = true,
  underline = true,
  update_in_insert = true,
  severity_sort = true,
  float = {
    focusable = false,
    style = "minimal",
    border = "rounded",
    source = "always",
    header = "",
    prefix = "",
  }
})

-- Diagnostic Keymaps
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, { desc = "Go to previous diagnostic message" })
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, { desc = "Go to next diagnostic message" })
vim.keymap.set('n', '<leader>d', vim.diagnostic.open_float, { desc = "Open floating diagnostic message" })
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = "Open diagnostics list" })

-- LSP settings.
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

  nmap('<leader>rn', vim.lsp.buf.rename, '[R]e[n]ame')
  nmap('<leader>ca', vim.lsp.buf.code_action, '[C]ode [A]ction')

  nmap('gd', vim.lsp.buf.definition, '[G]oto [D]efinition')
  nmap('gr', require('telescope.builtin').lsp_references, '[G]oto [R]eferences')
  nmap('gI', vim.lsp.buf.implementation, '[G]oto [I]mplementation')
  nmap('<leader>D', vim.lsp.buf.type_definition, 'Type [D]efinition')
  nmap('<leader>ds', require('telescope.builtin').lsp_document_symbols, '[D]ocument [S]ymbols')
  nmap('<leader>ws', require('telescope.builtin').lsp_dynamic_workspace_symbols, '[W]orkspace [S]ymbols')

  -- See `:help K` for why this keymap
  nmap('K', vim.lsp.buf.hover, 'Hover Documentation')
  nmap('<C-k>', vim.lsp.buf.signature_help, 'Signature Documentation')

  -- Lesser used LSP functionality
  nmap('gD', vim.lsp.buf.declaration, '[G]oto [D]eclaration')
  nmap('<leader>wa', vim.lsp.buf.add_workspace_folder, '[W]orkspace [A]dd Folder')
  nmap('<leader>wr', vim.lsp.buf.remove_workspace_folder, '[W]orkspace [R]emove Folder')
  nmap('<leader>wl', function()
    print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
  end, '[W]orkspace [L]ist Folders')

  -- Create a command `:Format` local to the LSP buffer
  vim.api.nvim_buf_create_user_command(bufnr, 'Format', function(_)
    vim.lsp.buf.format()
  end, { desc = 'Format current buffer with LSP' })
end

-- Enable the following language servers
--  Feel free to add/remove any LSPs that you want here. They will automatically be installed.
--
--  Add any additional override configuration in the following tables. They will be passed to
--  the `settings` field of the server config. You must look up that documentation yourself.
local servers = {
  -- clangd = {},
  -- gopls = {},
  pyright = {},
  rust_analyzer = {},
  tsserver = {},
  html = {},
  cssls = {},
  emmet_ls = {
	  filetypes = { "html", "typescriptreact", "javascriptreact", "css", "sass", "scss", "less", "svelte", "php", "astro" },
  },
  intelephense = {},
  phpactor = {},
  quick_lint_js = {},
  lua_ls = {
    Lua = {
      workspace = { checkThirdParty = false },
      telemetry = { enable = false },
    },
  },
}

-- Setup neovim lua configuration
require('neodev').setup()

-- nvim-cmp supports additional completion capabilities, so broadcast that to servers
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)

-- Setup mason so it can manage external tooling
require('mason').setup()

-- Ensure the servers above are installed
local mason_lspconfig = require 'mason-lspconfig'

mason_lspconfig.setup {
  ensure_installed = vim.tbl_keys(servers),
}

mason_lspconfig.setup_handlers {
  function(server_name)
    require('lspconfig')[server_name].setup {
      capabilities = capabilities,
      on_attach = on_attach,
      settings = servers[server_name],
    }
  end,
}

-- nvim-cmp setup
local luasnip = require 'luasnip'

luasnip.config.setup {}

-- initialize global var to false -> nvim-cmp turned off per default
vim.g.cmptoggle = true

-- toggle cmp keymap
vim.keymap.set("n", "<leader>x", "<cmd>lua vim.g.cmptoggle = not vim.g.cmptoggle<CR>", { desc = "toggle nvim-cmp" })
-- vim.keymap.set("i", "<C-Space>", "<cmd>lua cmp.mapping.complete()<CR>", { desc = "trigger nvim-cmp" })

cmp.setup
  ---@diagnostic disable-next-line missing-fields      
  {
  enabled = function()
    return vim.g.cmptoggle
  end,
  snippet = {
    expand = function(args)
      luasnip.lsp_expand(args.body)
    end,
  },
  mapping = cmp.mapping.preset.insert({
    ['<C-a>'] = cmp.mapping.complete(),
    ["<C-k>"] = cmp.mapping.select_prev_item(), -- previous suggestion
    ["<C-j>"] = cmp.mapping.select_next_item(), -- next suggestion
    ["<C-d>"] = cmp.mapping.scroll_docs(-4),
    ["<C-f>"] = cmp.mapping.scroll_docs(4),
    ['<C-e>'] = cmp.mapping.abort(),
    ['<C-a'] = cmp.mapping(cmp.mapping.complete()),
    ['<CR>'] = cmp.mapping.confirm {
      behavior = cmp.ConfirmBehavior.Replace,
      select = true,
    },
    ['<Tab>'] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_next_item()
      elseif luasnip.expand_or_jumpable() then
        luasnip.expand_or_jump()
      else
        fallback()
      end
    end, { 'i', 's' }),
    ['<S-Tab>'] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_prev_item()
      elseif luasnip.jumpable(-1) then
        luasnip.jump(-1)
      else
        fallback()
      end
    end, { 'i', 's' }),
  }),
  sources = {
    { name = 'nvim_lsp' },
    { name = 'luasnip' },
  },
}

require'lspconfig'.astro.setup{}
-----------------------
-- php stuff
-----------------------

-- import cmp-nvim-lsp plugin safely
local cmp_nvim_lsp_status, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
if not cmp_nvim_lsp_status then
	return
end

-- used to enable autocompletion (assign to every lsp server config)
-- local capabilities = 
cmp_nvim_lsp.default_capabilities()

-- import lspconfig plugin safely
local lspconfig_status, lspconfig = pcall(require, "lspconfig")
if not lspconfig_status then
	return
end

-- configure intelephense
lspconfig["intelephense"].setup({
	capabilities = capabilities,
	on_attach = on_attach,
  root_dir = require("lspconfig").util.root_pattern("composer.json", ".git", "*.php"),
})

-- configure phpactor
require'lspconfig'.phpactor.setup{
    on_attach = on_attach,
    init_options = {
        ["language_server_phpstan.enabled"] = false,
        ["language_server_psalm.enabled"] = false,
    },
  root_dir = require("lspconfig").util.root_pattern("composer.json", ".git", "*.php"),
}

-- configure ltex

--[[
require'lspconfig'.ltex.setup{
  on_attach = on_attach,
  cmd = { "ltex-ls" },
  filetypes = { "markdown", "text" },
  flags = { debounce_text_changes = 300 },
}
]]

-- configure emmet language server
lspconfig["emmet_ls"].setup({
	capabilities = capabilities,
	on_attach = on_attach,
	filetypes = { "html", "typescriptreact", "javascriptreact", "css", "sass", "scss", "less", "svelte", "php" },
})
-- The line beneath this is called `modeline`. See `:help modeline`
-- vim: ts=2 sts=2 sw=2 et
