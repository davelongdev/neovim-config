-- [[ Setting options ]]
-- See `:help vim.o`
-- NOTE: You can change these options as you wish!

-- expand tabs into spaces
vim.o.expandtab = true

-- set the number of columns for indenting and dedenting (when editing)
vim.o.shiftwidth = 2

-- set tabs to 2 (for when opening / closing file)
vim.o.tabstop = 2

-- adds virtual cells where there are none in the documentbibin
-- keeps virtual block mode as a block instead of stopping where there is no cell in the doc
vim.o.virtualedit = "block"

-- opens a split window to display certain info - eg with substitute command
vim.o.inccommand = "split"

-- ignore case in command mode when using autocomplete
-- case-insensitive searching UNLESS \C or capital in search ??rw
vim.o.ignorecase = true

-- if you include mixed case in your search, assumes you want case-sensitive
vim.o.smartcase = true

-- keeps cursor in center of screen when scrolling
vim.o.scrolloff = 999

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

-- keep signcolumn on by default
vim.wo.signcolumn = 'yes'

-- allow backspace on indent, end of line or insert mode start position?
-- vim.o.backspace = "indent,eol,start"

-- decrease update time
vim.o.timeoutlen = 300
vim.o.updatetime = 250 -- unsure abt this one - relates to swap file which is disabled - also used for cursorhold
vim.o.timeout = true  -- relaates to keys waiting for key combo see :help timeout

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

-- open splits on bottom
vim.o.splitbelow = true

-- open splits on rights
vim.o.splitright = true

vim.o.timeoutlen = 100
vim.o.ttimeoutlen = 100
vim.o.timeout = true

-- vim: ts=2 sts=2 sw=2 et
