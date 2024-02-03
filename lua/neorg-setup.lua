require('neorg').setup {
    load = {

      -- loads defaults
      ["core.defaults"] = {},

      -- conceals syntax code and adds icons
      ["core.concealer"] = {
        config = {
        icon_preset = 'diamond'
      }
    },

      -- manages neorg workspaces
      ["core.dirman"] = {
        config = {
          workspaces = {
            main = "~/neorg",
            notes = "~/neorg/notes",
          },
        },
      },

    -- adds table of contents functionality
    ["core.qol.toc"] = {
      config = {
        close_after_use = true
      }
    },
  }
}

require('which-key').register {
  ['<localleader>m'] = { name = '[m]ode', _ = 'which_key_ignore' },
  ['<localleader>i'] = { name = '[i]nsert', _ = 'which_key_ignore' },
  ['<localleader>l'] = { name = '[l]ist', _ = 'which_key_ignore' },
  ['<localleader>n'] = { name = '[n]eorg', _ = 'which_key_ignore' },
  ['<localleader>t'] = { name = '[t]o do', _ = 'which_key_ignore' },
}
