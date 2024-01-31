-- Set <space> as the leader key
-- See `:help mapleader`
--  NOTE: Must happen before plugins are required (otherwise wrong leader will be used)
vim.g.mapleader = ' '
vim.g.maplocalleader = ','

-- [[ Install `lazy.nvim` plugin manager ]]
require 'lazy-bootstrap'

-- [[ Configure plugins ]]
require 'lazy-plugins'

-- [[ Setting options ]]
require 'options'

-- [[ Basic Keymaps ]]
require 'keymaps'

-- [[ Configure Telescope ]]
-- fuzzy finder
require 'telescope-setup'

-- [[ Configure Treesitter ]]
-- syntax parser for highlighting etc.
require 'treesitter-setup'

-- [[ Configure LSP ]]
-- language server protocol
require 'lsp-setup'

-- [[ Configure nvim-cmp ]]
-- completion
require 'cmp-setup'

-- [[ Configure rainbow-delimiters ]]
-- adds colors to delimiters eg parenthesis
require 'rainbow-delimiters-setup'

-- [[ Configure bufferline ]]
-- shows buffers on top of main window like tabs
require 'bufferline-setup'

-- [[ Configure harpoon]]
-- creates project-specific marks (bookmarks)
require 'harpoon-setup'

-- [[ Configure diagnostics]]
-- set up how diagnostic messages show up
require 'diagnostics-setup'

-- [[ Configure neotree]]
-- file explorer
require 'neotree-setup'

-- [[ Configure whichkey]]
-- menu for pending keybinds
require 'whichkey-setup'


-- [[ Configure oil.nvim]]
-- vim-vinegar like file explorer 
require 'oil-setup'

-- [[ Configure gitsigns]]
-- shows git signs in sign column
require 'gitsigns-setup'

-- [[ Configure trouble.nvim]]
-- window for showing troubleshooting notifications
require 'trouble-setup'

-- [[ Configure treesj]]
-- splitting / joining blocks like arrays / objects
require 'treesj-setup'

-- [[ Configure neorg]]
-- neorg - org mode for nvim / notes etc.
require 'neorg-setup'

-- vim: ts=2 sts=2 sw=2 et
