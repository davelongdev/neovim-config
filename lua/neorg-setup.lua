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

    -- sets indent level
    ["core.esupports.indent"] = {
      config = {
        indents = {
          heading2 = {
            indent = 1
          },
          heading3 = {
            indent = 2
          },
          heading4 = {
            indent = 3
          },
          heading5 = {
            indent = 4
          },
          heading6 = {
            indent = 5
          }
        }
      }
    },
  }
}
