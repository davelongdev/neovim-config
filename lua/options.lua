-- [[ Setting options ]]
-- See `:help vim.o`
-- NOTE: You can change these options as you wish!

-- set highlight on search
vim.o.hlsearch = false

-- make line numbers default
vim.wo.number = true

-- enable mouse mode
vim.o.mouse = 'a'

-- sync clipboard between OS and Neovim.
--  remove this option if you want your OS clipboard to remain independent.
--  see `:help 'clipboard'`
vim.o.clipboard = 'unnamedplus'

-- enable break indent
vim.o.breakindent = true

-- save undo history
vim.o.undofile = true

-- case-insensitive searching UNLESS \C or capital in search
vim.o.ignorecase = true
vim.o.smartcase = true

-- keep signcolumn on by default
vim.wo.signcolumn = 'yes'

-- decrease update time
vim.o.timeoutlen = 300
-- vim.o.updatetime = 250 - relates to swap file (i think) which is disabled
-- vim.o.timeout = true  - relaates to keys waiting for key combo see :help timeoue

-- set completeopt to have a better completion experience
vim.o.completeopt = 'menuone,noselect'

-- for better colors
vim.o.termguicolors = true
vim.o.background = "dark" -- colorschemes that can be light or dark will be made dark

-- disable swapfile for using tmux
vim.o.swapfile=false

-- enable modeline
vim.o.modeline = true

-- set highlight on search
vim.o.hlsearch = true

-- make line numbers default
vim.wo.number = true

-- add relative line numbers
vim.o.relativenumber = true -- show relative line numbers

-- shows absolute line number on cursor line (when relative number is on)
vim.o.number = true

-- copy indent from current line when starting new one
vim.o.autoindent = true

-- clean up start screen
vim.o.shortmess = vim.o.shortmess .. 'I'

-- line wrapping
vim.o.wrap = false

-- cursor line
vim.o.cursorline = true -- highlight the current cursor line

-- enable break indent (:help breakindent)
vim.o.breakindent = true

-- vim: ts=2 sts=2 sw=2 et
