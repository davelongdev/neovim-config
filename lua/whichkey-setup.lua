local wk = require 'which-key'

wk.setup(
  {
    -- adds the leader to keymaps in the above register table
    -- prefix = "<leader>",

    -- below is pasted from defaults

    plugins = {
      marks = true, -- shows a list of your marks on ' and `
      registers = true, -- shows your registers on " in NORMAL or <C-r> in INSERT mode
      -- the presets plugin, adds help for a bunch of default keybindings in Neovim
      -- No actual key bindings are created
      spelling = {
        enabled = true, -- enabling this will show WhichKey when pressing z= to select spelling suggestions
        suggestions = 20, -- how many suggestions should be shown in the list?
      },
      presets = {
        operators = true, -- adds help for operators like d, y, ...
        motions = true, -- adds help for motions
        text_objects = true, -- help for text objects triggered after entering an operator
        windows = true, -- default bindings on <c-w>
        nav = true, -- misc bindings to work with windows
        z = true, -- bindings for folds, spelling and others prefixed with z
        g = true, -- bindings for prefixed with g
      },
    },
    -- add operators that will trigger motion and text object completion
    -- to enable all native operators, set the preset / operators plugin above
    icons = {
      breadcrumb = "»", -- symbol used in the command line area that shows your active key combo
      separator = "➜", -- symbol used between a key and it's label
      group = "+", -- symbol prepended to a group
    },
    layout = {
      height = { min = 4, max = 25 }, -- min and max height of the columns
      width = { min = 20, max = 50 }, -- min and max width of the columns
      spacing = 3, -- spacing between columns
      align = "left", -- align columns left, center or right
    },
    show_help = true, -- show a help message in the command line for using WhichKey
    show_keys = true, -- show the currently pressed key and its label as a message in the command line
    disable = {
      buftypes = {},
      filetypes = {},
    },
    spec = {
    -- document existing key chains - refactored from old spc in diagnostics-setup.lua
    { "<leader>c", group = "[c]ode" },
    { "<leader>c_", hidden = true },
    { "<leader>g", group = "[g]it" },
    { "<leader>g_", hidden = true },
    { "<leader>h", group = "git [h]unk" },
    { "<leader>h_", hidden = true },
    { "<leader>l", group = "[d]ocument" },
    { "<leader>l_", hidden = true },
    { "<leader>n", group = "[n]eorg [n]otes" },
    { "<leader>n_", hidden = true },
    { "<leader>r", group = "[r]ename" },
    { "<leader>r_", hidden = true },
    { "<leader>s", group = "[s]earch" },
    { "<leader>s_", hidden = true },
    { "<leader>t", group = "[t]oggle" },
    { "<leader>t_", hidden = true },
    { "<leader>w", group = "[w]orkspace" },
    { "<leader>w_", hidden = true },
    { "<leader>z", group = "misc mappings" },
    { "<leader>z_", hidden = true },
      -- register which-key VISUAL mode
      -- required for visual <leader>hs (hunk stage) to work
    { "<leader>", group = "VISUAL <leader>", mode = "v" },
    { "<leader>h", desc = "git [h]unk", mode = "v" },
    -- neorg mappings
    { "<localleader>i", group = "[i]nsert" },
    { "<localleader>i_", hidden = true },
    { "<localleader>l", group = "[l]ist" },
    { "<localleader>l_", hidden = true },
    { "<localleader>m", group = "[m]ode" },
    { "<localleader>m_", hidden = true },
    { "<localleader>n", group = "[n]eorg" },
    { "<localleader>n_", hidden = true },
    { "<localleader>t", group = "[t]o do" },
    { "<localleader>t_", hidden = true },
    }
  }
)
