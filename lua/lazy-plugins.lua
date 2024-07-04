
-- [[ Configure plugins ]]

-- NOTE: Here is where you install your plugins.
--  You can configure plugins using the `config` key.

--  You can also configure plugins after the setup call,
--    as they will be available in your neovim runtime.

-- import lazy package manager
require('lazy').setup({

-- [[ Misc plugins ]]

-- debugging stuff

  {
    {
    'mfussenegger/nvim-dap',
    config = function()

      local dap = require('dap')
      local dapui = require('dapui')

      dapui.setup()

      dap.listeners.before.attach.dapui_config = function()
        dapui.open()
      end
      dap.listeners.before.launch.dapui_config = function()
        dapui.open()
      end
      dap.listeners.before.event_terminated.dapui_config = function()
        dapui.close()
      end
      dap.listeners.before.event_exited.dapui_config = function()
        dapui.close()
      end
      
      -- f is closer and easier to type than b
      vim.keymap.set('n', '<Leader>df', dap.toggle_breakpoint, {desc = '[d]ebug toggle breakpoint'})

      vim.keymap.set('n', '<Leader>dc', dap.continue, {desc = '[d]ebug [c]ontinue'})
      vim.keymap.set("n", "<Leader>d1", dap.step_into, {desc = '[d]ebug step into'})
      vim.keymap.set("n", "<Leader>d2", dap.step_over, {desc = '[d]ebug step over'})
      vim.keymap.set("n", "<Leader>d3", dap.step_out, {desc = '[d]ebug step out'})
      vim.keymap.set("n", "<Leader>d4", dap.step_back, {desc = '[d]ebug step back'})
      vim.keymap.set("n", "<Leader>dr", dap.restart, {desc = '[d]ebug [r]estart'})
      vim.keymap.set("n", "<Leader>dx", dap.terminate, {desc = '[d]ebug terminate'})

     -- Eval var under cursor
      vim.keymap.set("n", "<space>?", function()
        dapui.eval(nil, { enter = true })
      end)

    end,
    },
    'rcarriga/nvim-dap-ui',
    'theHamsta/nvim-dap-virtual-text',
    'nvim-neotest/nvim-nio',
    {
      'mfussenegger/nvim-dap-python',
      ft = 'python',
      config = function()
        require('dap-python').setup('python')
      end,
    },
  },

-- visualize undo history as tree
  'mbbill/undotree',

-- for better experience with folds
  {'kevinhwang91/nvim-ufo',
    dependencies = 'kevinhwang91/promise-async'
  },

-- adds extra keymaps for common commands
  'tpope/vim-unimpaired',

-- adds luarocks for neorg
  {
      "vhyrro/luarocks.nvim",
      priority = 1000, -- We'd like this plugin to load first out of the rest
      config = true, -- This automatically runs `require("luarocks-nvim").setup()`
  },
  {
      "nvim-neorg/neorg",
      dependencies = { "luarocks.nvim" },
  },
-- neorg - org mode for nvim / notes etc.
  -- {
  --   "nvim-neorg/neorg",
  --   -- tag = "*",
  --   dependencies = { "nvim-lua/plenary.nvim" },
  -- },
  --
-- splitting / joining blocks like arrays / objects
  'Wansmer/treesj',

-- window for showing troubleshooting notifications
  'folke/trouble.nvim',

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
  -- {
  --   'junegunn/vim-peekaboo',
  --   config = function()
  --     vim.g.peekaboo_window="horiz bo 30new"
  --   end,
  -- },

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
  config = true,
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

  -- {
  -- 'vimwiki/vimwiki',
  -- init = function()
  --   vim.g.vimwiki_list = {
  --     {
  --       path = '~/vimwiki/',
  --       syntax = 'markdown',
  --       ext = '.md',
  --       listsyms_propagate = 0,
  --     },
  --   }
  -- end,
  -- },

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
      vim.cmd.colorscheme 'catppuccin-mocha'
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
