-- [[ Basic Keymaps from Kickstart ]]

-- Keymaps for better default experience
-- See `:help vim.keymap.set()`
vim.keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })

-- Remap for dealing with word wrap / unsure of this part
-- vim.keymap.set('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
-- vim.keymap.set('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

-- Diagnostic keymaps
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, { desc = 'Go to previous diagnostic message' })
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, { desc = 'Go to next diagnostic message' })
vim.keymap.set('n', '<leader>q', vim.diagnostic.open_float, { desc = 'Open floating diagnostic message' })
vim.keymap.set('n', '<leader>Q', vim.diagnostic.setloclist, { desc = 'Open diagnostics list' })

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

-- Vertical Movement - half page & stays in center
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")

-- use jk to exit insert, visual, and command mode
-- -- command mode jk setup needs to be refined
vim.keymap.set({ "i", "v" }, "jk", "<ESC>")
vim.keymap.set("c", "jk", "<C-c>")

-- clear search highlights
vim.keymap.set("n", "<leader>nh", ":nohl<CR>")

-- delete single character without copying into register
-- vim.keymap.set("n", "x", '"_x')

--delete line without copying 
-- vim.keymap.set("n", "zd", '"_dd')

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

-- Move single line of text up and down
vim.keymap.set("n", "<M-j>", "<Esc>:m .+1<CR>==")
vim.keymap.set("n", "<M-k>", "<Esc>:m .-2<CR>==")

-- Move selected lines up and down in visual mode
vim.keymap.set("v", "<M-j>", ":m .+1<CR>==")
vim.keymap.set("v", "<M-k>", ":m .-2<CR>==")

-- Keep lines selected in visual mode after first move (works with above)
vim.keymap.set("x", "<M-j>", ":move '>+1<CR>gv-gv")
vim.keymap.set("x", "<M-k>", ":move '<-2<CR>gv-gv")

-- adjust paste functionality in visual mode
-- vim.keymap.set("v", "p", '"_dP')

-- Move selected text left & right in visual mode and stay in visual mode (works in visual or visual line modes)
vim.keymap.set("v", "<", "<gv")
vim.keymap.set("v", ">", ">gv")

-- toggles neotree file explorer
vim.keymap.set("n", "<leader>e", ":Neotree toggle<CR>")

-- deletes selected buffer
vim.keymap.set("n", "<leader>m", ":bdelete<Cr>")

-- refreshed neotree status icons
vim.keymap.set("n", "<M-q>", ":lua require('neo-tree.sources.manager').refresh()<CR>")

-- toggling nvim-cmp functionality (autocompletion) on and off and logging status message to command prompt area
vim.keymap.set("n", "<leader>x", function ()
  vim.g.cmptoggle = not vim.g.cmptoggle
  vim.notify("Cmp " .. (vim.g.cmptoggle and "enabled" or "disabled"))
end, { desc = "toggle nvim-cmp" })

-- shorcut to source the luasnips file, which will reload the snippets in this file
vim.keymap.set("n", "<leader>v", ":source ~/.config/nvim/lua/my-snippets.lua<CR>", { desc = 'source my-snippets' } )

-- vim: ts=2 sts=2 sw=2 et
