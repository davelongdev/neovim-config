-- [[ Setting options ]]

-- See `:help vim.o`
-- See `:help vim.opt`
-- NOTE: You can change these options as you wish!

-- expand tabs into spaces
vim.opt.expandtab = true

-- set the number of columns for indenting and dedenting (when editing)
vim.opt.shiftwidth = 2

-- set tabs to 2 (for when opening / closing file)
vim.opt.tabstop = 2

-- adds virtual cells where there are none in the documentbibin
-- keeps virtual block mode as a block instead of stopping where there is no cell in the doc
vim.opt.virtualedit = "block"

-- opens a split window to display certain info - eg with substitute command
vim.opt.inccommand = "split"

-- ignore case in command mode when using autocomplete
-- case-insensitive searching UNLESS \C or capital in search ??rw
vim.opt.ignorecase = true

-- if you include mixed case in your search, assumes you want case-sensitive
vim.opt.smartcase = true

-- keeps cursor in center of screen when scrolling
vim.opt.scrolloff = 999

-- set highlight on search
vim.opt.hlsearch = false

-- make line numbers default
vim.opt.number = true

-- enable mouse mode
vim.opt.mouse = 'a'

-- sync clipboard between OS and Neovim.
--  remove this option if you want your OS clipboard to remain independent.
--  see `:help 'clipboard'`
vim.opt.clipboard = 'unnamedplus'

-- enable break indent
vim.opt.breakindent = true

-- save undo history
vim.opt.undofile = true

-- keep signcolumn on by default
vim.opt.signcolumn = 'yes'

-- allow backspace on indent, end of line or insert mode start position?
-- vim.opt.backspace = "indent,eol,start"

-- decrease update time
vim.opt.timeoutlen = 300
vim.opt.updatetime = 250 -- unsure abt this one - relates to swap file which is disabled - also used for cursorhold
vim.opt.timeout = true  -- relaates to keys waiting for key combo see :help timeout

-- set completeopt to have a better completion experience
vim.opt.completeopt = 'menuone,noselect'

-- for better colors
vim.opt.termguicolors = true
vim.opt.background = "dark" -- colorschemes that can be light or dark will be made dark

-- disable swapfile for using tmux
vim.opt.swapfile=false

-- enable modeline
vim.opt.modeline = true

-- set highlight on search
vim.opt.hlsearch = true

-- make line numbers default
vim.opt.number = true

-- add relative line numbers
vim.opt.relativenumber = true -- show relative line numbers

-- shows absolute line number on cursor line (when relative number is on)
vim.opt.number = true

-- copy indent from current line when starting new one
vim.opt.autoindent = true

-- clean up start screen
vim.opt.shortmess:append("I")

-- line wrapping
vim.opt.wrap = false

-- cursor line
vim.opt.cursorline = true -- highlight the current cursor line

-- enable break indent (:help breakindent)
vim.opt.breakindent = true

-- open splits on bottom
vim.opt.splitbelow = true

-- open splits on rights
vim.opt.splitright = true

vim.opt.timeoutlen = 100
vim.opt.ttimeoutlen = 100

-- vim: ts=2 sts=2 sw=2 et
