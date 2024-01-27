
-- [[ Configure plugins ]]

-- NOTE: Here is where you install your plugins.
--  You can configure plugins using the `config` key.

--  You can also configure plugins after the setup call,
--    as they will be available in your neovim runtime.

-- import lazy package manager
require('lazy').setup({

-- [[ Misc plugins ]]

-- adds repeat functionality with . for plugins
  'tpope/vim-repeat',

-- add window maximize functionality
  'szw/vim-maximizer',

-- show an organized view of a file's language objects / tags
  'preservim/tagbar',

-- display marks
'kshenoy/vim-signature',

-- vim-vinegar-like file explorer
  'stevearc/oil.nvim',

-- adds a nice menu for registers when " is typed 
  -- navigate window w/ pgup pgdn
  {
    'junegunn/vim-peekaboo',
    config = function()
      vim.g.peekaboo_window="horiz bo 30new"
    end,
  },

-- allows project-specific marks (bookmarks)
  'ThePrimeagen/harpoon',

-- allows ctl + hjkl to navigate between windows as in tmux
  'christoomey/vim-tmux-navigator',

-- for surrounding text
  'tpope/vim-surround',

-- colored delimiters like parentesis
  'HiPhish/rainbow-delimiters.nvim',

-- shows color blocks in the file so you can see your colors
  'ap/vim-css-color',

  -- Git related plugins
  'tpope/vim-fugitive',
  'tpope/vim-rhubarb',

{
  "NeogitOrg/neogit",
  dependencies = {
    "nvim-lua/plenary.nvim",         -- required
    "sindrets/diffview.nvim",        -- optional - Diff integration

    -- Only one of these is needed, not both.
    "nvim-telescope/telescope.nvim", -- optional
    "ibhagwan/fzf-lua",              -- optional
  },
  config = true
},

  -- Detect tabstop and shiftwidth automatically
  'tpope/vim-sleuth',

-- autopairing for things like () and {}
  {
    'windwp/nvim-autopairs',
    event = "InsertEnter",
    opts = {} -- this is equalent to setup({}) function
  },

-- shows buffers on top of main window like tabs
  {
    'akinsho/bufferline.nvim',
    version = "*",
},

-- vimwiki for notetaking / sets filetype to md
  {
  'vimwiki/vimwiki',
  init = function()
    vim.g.vimwiki_list = {
      {
        path = '~/vimwiki/',
        syntax = 'markdown',
        ext = '.md',
        listsyms_propagate = 0,
      },
    }
  end,
  },

-- neo tree file explorer
  {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "MunifTanjim/nui.nvim",
      -- "3rd/image.nvim", -- Optional image support in preview window: See `# Preview Mode` for more information
    },
  },

-- jsdoc automation for js comment/documentation generation
  {
    'heavenshell/vim-jsdoc',
    config = function()
      vim.g.jsdoc_lehre_path = '/Users/dave/.nvm/versions/node/v20.10.0/bin/lehre'
    end,
  },

  -- installs catppuccin-macchiato theme and sets it as default
  {
    'catppuccin/nvim',
    priority = 1000,
    config = function()
      vim.cmd.colorscheme 'catppuccin-macchiato'
    end,
  },

  -- NOTE: This is where plugins related to LSP can be installed.
  --  The configuration is done below. Search for lspconfig to find it below.
  {
    -- LSP Configuration & Plugins
    'neovim/nvim-lspconfig',
    dependencies = {

      -- Automatically install LSPs to stdpath for neovim
      { 'williamboman/mason.nvim', config = true },
      'williamboman/mason-lspconfig.nvim',

      -- Additional lua configuration, makes nvim stuff amazing!
      'folke/neodev.nvim',
    },
  },

  {
    -- Autocompletion
    'hrsh7th/nvim-cmp',
    dependencies = {
      -- Snippet Engine & its associated nvim-cmp source
      'L3MON4D3/LuaSnip',
      'saadparwaiz1/cmp_luasnip',

      -- Adds LSP completion capabilities
      'hrsh7th/cmp-nvim-lsp',
      'hrsh7th/cmp-path',

      -- Adds a number of user-friendly snippets
      'rafamadriz/friendly-snippets',
    },
  },

  -- shows menu for pending keymaps
  'folke/which-key.nvim',

  -- Adds git related signs to the gutter, as well as utilities for managing changes
  {
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
      on_attach = function(bufnr)
        local gs = package.loaded.gitsigns

        local function map(mode, l, r, opts)
          opts = opts or {}
          opts.buffer = bufnr
          vim.keymap.set(mode, l, r, opts)
        end

        -- Navigation
        map({ 'n', 'v' }, ']c', function()
          if vim.wo.diff then
            return ']c'
          end
          vim.schedule(function()
            gs.next_hunk()
          end)
          return '<Ignore>'
        end, { expr = true, desc = 'Jump to next hunk' })

        map({ 'n', 'v' }, '[c', function()
          if vim.wo.diff then
            return '[c'
          end
          vim.schedule(function()
            gs.prev_hunk()
          end)
          return '<Ignore>'
        end, { expr = true, desc = 'Jump to previous hunk' })

        -- Actions

        -- visual mode
        map('v', '<leader>hs', function()
          gs.stage_hunk { vim.fn.line '.', vim.fn.line 'v' }
        end, { desc = 'stage git hunk' })
        map('v', '<leader>hr', function()
          gs.reset_hunk { vim.fn.line '.', vim.fn.line 'v' }
        end, { desc = 'reset git hunk' })

        -- normal mode
        map('n', '<leader>hj', gs.next_hunk, { desc = 'git next hunk' })
        map('n', '<leader>hk', gs.prev_hunk, { desc = 'git prev hunk' })
        map('n', '<leader>hs', gs.stage_hunk, { desc = 'git [s]tage hunk' })
        map('n', '<leader>hr', gs.reset_hunk, { desc = 'git [r]eset hunk' })
        map('n', '<leader>hS', gs.stage_buffer, { desc = 'git [S]tage buffer' })
        map('n', '<leader>hu', gs.undo_stage_hunk, { desc = '[u]ndo stage hunk' })
        map('n', '<leader>hR', gs.reset_buffer, { desc = 'git [R]eset buffer' })
        map('n', '<leader>hp', gs.preview_hunk, { desc = '[p]review git hunk' })
        map('n', '<leader>hb', function()
          gs.blame_line { full = false }
        end, { desc = 'git blame line' })
        map('n', '<leader>hd', gs.diffthis, { desc = 'git diff against index' })
        map('n', '<leader>hD', function()
          gs.diffthis '~'
        end, { desc = 'git diff against last commit' })

        -- Toggles
        map('n', '<leader>tb', gs.toggle_current_line_blame, { desc = 'toggle git blame line' })
        map('n', '<leader>td', gs.toggle_deleted, { desc = 'toggle git show deleted' })

        -- Text object
        map({ 'o', 'x' }, 'ih', ':<C-U>Gitsigns select_hunk<CR>', { desc = 'select git hunk' })
      end,
    },
  },

  -- Theme inspired by Atom
  {
    'navarasu/onedark.nvim',
  },

-- Set lualine as statusline and add theme for statusline
  {
    'nvim-lualine/lualine.nvim',
    -- See `:help lualine.txt`
    opts = {
      options = {
        icons_enabled = false,
        theme = 'catppuccin-macchiato',
        component_separators = '|',
        section_separators = '',
      },
    },
  },

-- Add indentation guides even on blank lines
  {
    'lukas-reineke/indent-blankline.nvim',
    -- Enable `lukas-reineke/indent-blankline.nvim`
    -- See `:help ibl`
    main = 'ibl',
    opts = {},
  },

-- auto-comment / "gc" to comment visual regions/lines
  { 'numToStr/Comment.nvim', opts = {} },

-- telescopt / fuzzy finder (files, lsp, etc)
  {
    'nvim-telescope/telescope.nvim',
    branch = '0.1.x',
    dependencies = {
      'nvim-lua/plenary.nvim',
      -- Fuzzy Finder Algorithm which requires local dependencies to be built.
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
    },
  },

-- treesitter / create abstract syntax tree / eg -  highlight, indent, edit, and navigate code
  {
    'nvim-treesitter/nvim-treesitter',
    dependencies = {
      'nvim-treesitter/nvim-treesitter-textobjects',
    },
    build = ':TSUpdate',
  },

  -- additional plugins from kickstart.

  -- require 'kickstart.plugins.autoformat',
  -- require 'kickstart.plugins.debug',

}, {})

-- vim: ts=2 sts=2 sw=2 et
