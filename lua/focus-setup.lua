-- [[ Reading / focus plugins ]]
-- Both cap how wide the text is *on screen* without touching the file, so
-- unwrapped markdown (one line per paragraph) reads at ~80 columns in a
-- full-size window and still reflows in a half-size one.
--
--   <leader>tn  toggle no-neck-pain: pads the sides, everything else stays
--   <leader>tz  toggle zen-mode:     one centred window, statusline etc. hidden

-- 80 columns of text + number/sign gutter
local text_width = 90

require('no-neck-pain').setup({
  width = text_width,
  autocmds = {
    -- don't auto-enable; toggle by hand so splits/neo-tree aren't disturbed
    enableOnVimEnter = false,
    enableOnTabEnter = false,
  },
  buffers = {
    right = { enabled = true },
    left = { enabled = true },
    -- keep the side buffers plain: no numbers, no colorcolumn
    wo = { number = false, relativenumber = false, signcolumn = 'no' },
  },
})

require('zen-mode').setup({
  window = {
    width = text_width,
    options = {
      number = false,
      relativenumber = false,
      signcolumn = 'no',
    },
  },
  plugins = {
    options = { enabled = true, ruler = false, showcmd = false },
    gitsigns = { enabled = true }, -- hide git signs while in zen
  },
})

vim.keymap.set('n', '<leader>tn', '<cmd>NoNeckPain<CR>', { desc = '[t]oggle [n]o-neck-pain (narrow text)' })
vim.keymap.set('n', '<leader>tz', '<cmd>ZenMode<CR>', { desc = '[t]oggle [z]en mode' })
