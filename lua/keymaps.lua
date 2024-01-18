-- [[ Basic Keymaps from Kickstart ]]

-- Keymaps for better default experience
-- See `:help vim.keymap.set()`
vim.keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })

-- Remap for dealing with word wrap
vim.keymap.set('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
vim.keymap.set('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

-- Diagnostic keymaps
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, { desc = 'Go to previous diagnostic message' })
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, { desc = 'Go to next diagnostic message' })
vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, { desc = 'Open floating diagnostic message' })
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostics list' })

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

-- [[ my personal keymaps ]]



-- for navigating links in the help file - changes ctl to option on mac
vim.keymap.set("n", "<M-l>", "<C-]>")
vim.keymap.set("n", "<M-o>", "<C-o>")

--command mode movement
vim.keymap.set("c", "<C-h>", "<Left>")
vim.keymap.set("c", "<C-l>", "<Right>")
vim.keymap.set("c", "<C-j>", "<Down>")
vim.keymap.set("c", "<C-k>", "<Up>")
vim.keymap.set("c", "<C-a>", "<Home>")
vim.keymap.set("c", "<C-e>", "<End>")
vim.keymap.set("c", "<C-b>", "<S-Left>")
vim.keymap.set("c", "<C-w>", "<S-Right>")

--cyling within command mode completion menu
vim.cmd('cnoremap <c-k> <c-p>')
vim.cmd('cnoremap <c-j> <c-n>')

-- ???  something for delete and yank / paste
-- vim.keymap.set("n", "zd", '"_dd')

-- Vertical Movement - half page & stays in center
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")

-- use jk to exit insert and visual mode
vim.keymap.set("i", "jk", "<ESC>")
vim.keymap.set("v", "jk", "<ESC>")
-- vim.keymap.set("c", "jk", "<ESC>") - seems to map jk to <CR>? 

-- clear search highlights
vim.keymap.set("n", "<leader>nh", ":nohl<CR>")

-- delete single character without copying into register
vim.keymap.set("n", "x", '"_x')

-- increment/decrement numbers
vim.keymap.set("n", "<leader>+", "<C-a>") -- increment
vim.keymap.set("n", "<leader>-", "<C-x>") -- decrement

-- resize windows
vim.keymap.set("n", "<M-Up>", ":resize -2<CR>")
vim.keymap.set("n", "<M-Down>", ":resize +2<CR>")
vim.keymap.set("n", "<M-Left>", ":vertical resize -2<CR>")
vim.keymap.set("n", "<M-Right>", ":vertical resize +2<CR>")

-- Navigate buffers
vim.keymap.set("n", "<leader>l", ":bnext<CR>")
vim.keymap.set("n", "<leader>h", ":bprevious<CR>")

-- Move text up and down
vim.keymap.set("n", "<M-j>", "<Esc>:m .+1<CR>==")
vim.keymap.set("n", "<M-k>", "<Esc>:m .-2<CR>==")

-- Move selected text left & right in visual mode and stay in visual mode (works in visual or visual line modes)
vim.keymap.set("v", "<", "<gv")
vim.keymap.set("v", ">", ">gv")

-- neotree
vim.keymap.set("n", "<leader>e", ":Neotree toggle<CR>") -- toggle neotree file explorer

-- vim: ts=2 sts=2 sw=2 et
